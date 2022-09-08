import '../entities/task_entity.dart';
import '../repositories/local_repository.dart';

class GetTaskNotificationUseCase {
  final LocalRepository localRepository;

  GetTaskNotificationUseCase.name({required this.localRepository});

  Future<void> call(TaskEntity task) {
    return localRepository.getTaskNotification(task);
  }
}