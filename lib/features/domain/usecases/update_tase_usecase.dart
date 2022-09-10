import '../entities/task_entity.dart';
import '../repositories/local_repository.dart';

class UpdateTaskUseCase {
  final LocalRepository localRepository;

  UpdateTaskUseCase({required this.localRepository});

  Future<void> call(TaskEntity task) {
    return localRepository.updateTask(task);
  }
}
