
import '../entities/task_entity.dart';
import '../repositories/local_repository.dart';

class GetAllTaskUseCase{
  final LocalRepository localRepository;
  GetAllTaskUseCase.name({required this.localRepository});
  Future<List<TaskEntity>> call() {
    return localRepository.getAllTaskList();
  }

}
