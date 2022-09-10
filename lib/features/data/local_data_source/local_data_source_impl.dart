import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_daily_tase/features/data/model/task_model.dart';
import 'package:my_daily_tase/features/domain/repositories/local_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import '../../domain/entities/task_entity.dart';
import 'package:path/path.dart';

const String MAP_STORE = "MAP_STORE_TASK";

class LocalDataSourceImpl implements LocalRepository {
  late Completer<Database> _dbOpenCompleter;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<Database> get _db async => _dbOpenCompleter.future;
  final _taskStore = intMapStoreFactory.store(MAP_STORE);

  Future<void> _initDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentDir.path, "task.db");
    final dataBase = await databaseFactoryIo.openDatabase(dbPath);
    _dbOpenCompleter.complete(dataBase);
  }

  @override
  Future<void> addTask(TaskEntity task) async {
    final newTask = TaskModel(
            title: task.title,
            time: task.time,
            isCompletedTask: task.isCompletedTask,
            isNotification: task.isNotification,
            colorID: task.colorID,
            taskType: task.taskType)
        .toJson();

    _taskStore.add(await _db, newTask);
  }

  @override
  Future<void> deleteTask(TaskEntity task) async {
    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.delete(await _db, finder: finder);
  }

  @override
  Future<List<TaskEntity>> getAllTaskList() async {
    final finder = Finder(sortOrders: [SortOrder("id")]);
    final recordSnapshots = await _taskStore.find(await _db, finder: finder);

    return recordSnapshots.map((task) {
      final taskData = TaskModel.fromJson(task.value);
      taskData.id = task.key;
      return taskData;
    }).toList();
  }

  @override
  Future<void> getTaskNotification(TaskEntity task) async {
    if (task.isNotification == false) {
      final dateTime = DateTime.parse(task.time);
      final androidNotificationChannel = AndroidNotificationDetails(
          task.id.toString(), "Daily Task", "This is a test notification",
          playSound: true,
          enableLights: true,
          enableVibration: true,
          icon: "mipmap/ic_launcher",
          largeIcon: const DrawableResourceAndroidBitmap("mipmap/ic_launcher"),
          ticker: "This is a ticker");

      const iosNotificationChannel = IOSNotificationDetails();
      final notificationDetails = NotificationDetails(
          android: androidNotificationChannel, iOS: iosNotificationChannel);

      flutterLocalNotificationsPlugin.showDailyAtTime(
          task.id!,
          task.title,
          "It's time for ${task.title}",
          Time(dateTime.hour, dateTime.minute, 0),
          notificationDetails);
    } else {
      flutterLocalNotificationsPlugin.cancel(task.id!);
    }
  }

  @override
  Future<void> onTaskNotification(TaskEntity task) async {
    final newTask = TaskModel(
            title: task.title,
            time: task.time,
            isCompletedTask: task.isCompletedTask,
            isNotification: task.isNotification == true ? false : true,
            colorID: task.colorID,
            taskType: task.taskType)
        .toJson();

    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.update(await _db, newTask, finder: finder);
  }

  @override
  Future<Database> openDatabase() {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      _initDatabase();
    }
    return _dbOpenCompleter.future;
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final newTask = TaskModel(
            title: task.title,
            time: task.time,
            isCompletedTask: task.isCompletedTask == true ? false : true,
            isNotification: task.isNotification,
            colorID: task.colorID,
            taskType: task.taskType)
        .toJson();

    final finder = Finder(filter: Filter.byKey(task.id));
    _taskStore.update(await _db, newTask, finder: finder);
  }
}
