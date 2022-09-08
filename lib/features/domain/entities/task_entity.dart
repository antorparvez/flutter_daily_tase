class TaskEntity {
  int? id;
  final String title;
  final String time;
  final bool isCompletedTask;
  final String isNotification;
  final int colorID;

  TaskEntity(
      {this.id,
      required this.title,
      required this.time,
      required this.isCompletedTask,
      required this.isNotification,
      required this.colorID});
}
