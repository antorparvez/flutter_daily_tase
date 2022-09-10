class TaskEntity {
  int? id;
  final String title;
  final String time;
  final bool isCompletedTask;
  final bool isNotification;
  final int colorID;
  final String taskType;

  TaskEntity(
      {this.id,
      required this.title,
      required this.time,
      required this.isCompletedTask,
      required this.isNotification,
      required this.colorID,
      required this.taskType});
}
