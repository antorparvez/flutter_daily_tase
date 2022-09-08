import '../repositories/local_repository.dart';

class OpenDatabaseUseCase{
  final LocalRepository localRepository;
  OpenDatabaseUseCase.name({required this.localRepository});
  Future<void> call() {
    return localRepository.openDatabase();
  }

}