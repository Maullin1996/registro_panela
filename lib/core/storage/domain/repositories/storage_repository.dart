abstract class StorageRepository {
  Future<String> uploadImage({
    required String path,
    required String localFilePath,
  });
}
