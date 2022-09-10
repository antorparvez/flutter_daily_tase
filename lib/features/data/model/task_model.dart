import 'package:my_daily_tase/features/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    int? id,
    required final String title,
    required final String time,
    required final bool isCompletedTask,
    required final bool isNotification,
    required final int colorID,
    required final String taskType,
  }) : super(
      title: title,
      time: time,
      isCompletedTask: isCompletedTask,
      isNotification: isNotification,
      colorID: colorID,
      taskType: taskType);

  static TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json["title"],
      time: json["time"],
      isCompletedTask: json["isCompletedTask"],
      isNotification: json["isNotification"],
      colorID: json["colorID"],
      taskType: json["taskType"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "time": time,
      "isCompletedTask": isCompletedTask,
      "isNotification": isNotification,
      "colorID": colorID,
      "taskType": taskType
    };
  }
}
