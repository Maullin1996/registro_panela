import 'package:registro_panela/core/storage/data/datasource/firebase_storage_datasource.dart';
import 'package:registro_panela/core/storage/domain/repositories/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  final FirebaseStorageDatasource datasource;

  StorageRepositoryImpl(this.datasource);

  @override
  Future<String> uploadImage({
    required String path,
    required String localFilePath,
  }) {
    return datasource.uploadImage(path: path, localFilePath: localFilePath);
  }
}
