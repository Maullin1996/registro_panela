import 'package:registro_panela/core/storage/domain/repositories/storage_repository.dart';

class UploadImage {
  final StorageRepository repository;

  UploadImage(this.repository);

  Future<String> call({required String path, required String localFilePath}) {
    return repository.uploadImage(path: path, localFilePath: localFilePath);
  }
}
