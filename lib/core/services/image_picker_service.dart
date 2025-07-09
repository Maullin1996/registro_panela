import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  /// Llama a la cámara o galería
  Future<String?> pickImage({bool fromCamera = true}) async {
    final picker = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
    );
    return picker?.path;
  }
}
