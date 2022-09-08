
import '../repositories/local_repository.dart';

class GetAllTaskUseCase{
  final LocalRepository localRepository;
  GetAllTaskUseCase.name({required this.localRepository});
  Future<void> call() {
    return localRepository.getAllTaskList();
  }

}
