import '../entities/task_entity.dart';
import '../repositories/local_repository.dart';

class OffTaskNotificationUseCase {
  final LocalRepository localRepository;

  OffTaskNotificationUseCase({required this.localRepository});

  Future<void> call(TaskEntity task) {
    return localRepository.getTaskNotification(task);
  }
}