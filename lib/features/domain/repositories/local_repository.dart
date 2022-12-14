
import 'package:my_daily_tase/features/domain/entities/task_entity.dart';
import 'package:sembast/sembast.dart';

abstract class LocalRepository{

  Future<Database> openDatabase();
  Future<void> addTask(TaskEntity task);
  Future<void> deleteTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> getTaskNotification(TaskEntity task);
  Future<void> onTaskNotification(TaskEntity task);
  Future<List<TaskEntity>> getAllTaskList();

}