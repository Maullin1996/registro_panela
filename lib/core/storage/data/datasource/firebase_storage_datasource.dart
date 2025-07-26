import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageDatasource {
  final FirebaseStorage _storage;

  FirebaseStorageDatasource({FirebaseStorage? storage})
    : _storage = storage ?? FirebaseStorage.instance;

  Future<String> uploadImage({
    required String path,
    required String localFilePath,
  }) async {
    final ref = _storage.ref().child(path);
    final uploadTask = await ref.putFile(File(localFilePath));
    return await uploadTask.ref.getDownloadURL();
  }
}
