
import 'package:my_daily_tase/features/domain/entities/task_entity.dart';

abstract class LocalRepository{

  Future<void> openDatabase();
  Future<void> addTask(TaskEntity task);
  Future<void> deleteTask(TaskEntity task);
  Future<void> updateTask(TaskEntity task);
  Future<void> getTaskNotification(TaskEntity task);
  Future<void> getAllTaskList();

}