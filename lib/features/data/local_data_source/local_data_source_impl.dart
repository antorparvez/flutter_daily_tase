import 'dart:async';

import 'package:my_daily_tase/features/data/model/task_model.dart';
import 'package:my_daily_tase/features/domain/repositories/local_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import '../../domain/entities/task_entity.dart';
import 'local_data_scource.dart';
import 'sembast/sembast.dart';
import 'package:path/path.dart';

const String MAP_STORE = "MAP_STORE_TASK";

class LocalDataSourceImpl implements LocalRepository {
  late Completer<Database> _dbOpenCompleter;

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

    return recordSnapshots.map((task){
      final taskData = TaskModel.fromJson(task.value);
      taskData.id = task.key;
      return taskData;
    }).toList();

  }

  @override
  Future<void> getTaskNotification(TaskEntity task) {
    // TODO: implement getTaskNotification
    throw UnimplementedError();
  }

  @override
  Future<void> onTaskNotification(TaskEntity task) {
    // TODO: implement onTaskNotification
    throw UnimplementedError();
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
  Future<void> updateTask(TaskEntity task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
