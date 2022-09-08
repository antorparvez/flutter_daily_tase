
import 'package:sembast/sembast.dart';

import '../../domain/entities/task_entity.dart';

abstract class LocalDataSource{
  Future<Database> openDatabase();
  Future<void> addTask(TaskEntity task);
  Future<void> deleteTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> getTaskNotification(TaskEntity task);
  Future<void> onTaskNotification(TaskEntity task);
  Future<List<TaskEntity>> getAllTaskList();
}