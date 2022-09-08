import 'package:my_daily_tase/features/domain/entities/task_entity.dart';
import 'package:my_daily_tase/features/domain/repositories/local_repository.dart';
import 'package:sembast/sembast.dart';

import '../local_data_source/local_data_scource.dart';

class LocalDataRepositoryImp extends LocalRepository{
  final LocalDataSource localDataSource;

  LocalDataRepositoryImp({required this.localDataSource});
  @override
  Future<void> addTask(TaskEntity task) async => localDataSource.addTask(task);

  @override
  Future<void> deleteTask(TaskEntity task) async =>
      localDataSource.deleteTask(task);

  @override
  Future<List<TaskEntity>> getAllTaskList() async => localDataSource.getAllTaskList();

  @override
  Future<void> getTaskNotification(TaskEntity task) async =>
      localDataSource.getTaskNotification(task);

  @override
  Future<void> onTaskNotification(TaskEntity task) async =>
      localDataSource.onTaskNotification(task);

  @override
  Future<Database> openDatabase() async => localDataSource.openDatabase();

  @override
  Future<void> updateTask(TaskEntity task) async =>
      localDataSource.updateTask(task);
}