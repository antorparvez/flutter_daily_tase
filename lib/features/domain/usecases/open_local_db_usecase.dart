import '../repositories/local_repository.dart';

class OpenDatabaseUseCase{
  final LocalRepository localRepository;
  OpenDatabaseUseCase({required this.localRepository});
  Future<void> call() {
    return localRepository.openDatabase();
  }

}