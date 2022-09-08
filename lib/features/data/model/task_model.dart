import 'package:my_daily_tase/features/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    int? id,
    required final String title,
    required final String time,
    required final bool isCompletedTask,
    required final String isNotification,
    required final int colorID,
  }) : super(
            title: title,
            time: time,
            isCompletedTask: isCompletedTask,
            isNotification: isNotification,
            colorID: colorID);

  static TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
        title: json["title"],
        time: json["time"],
        isCompletedTask: json["isCompletedTask"],
        isNotification: json["isNotification"],
        colorID: json["colorID"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "time": time,
      "isCompletedTask": isCompletedTask,
      "isNotification": isNotification,
      "colorID": colorID
    };
  }
}
