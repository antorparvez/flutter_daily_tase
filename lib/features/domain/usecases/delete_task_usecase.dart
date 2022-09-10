
import '../entities/task_entity.dart';
import '../repositories/local_repository.dart';

class DeleteTaskUseCase {
  final LocalRepository localRepository;

  DeleteTaskUseCase({required this.localRepository});

  Future<void> call(TaskEntity task) {
    return localRepository.deleteTask(task);
  }
}