import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:registro_panela/core/services/image_picker_service.dart';

final imagePickerServiceProvider = Provider<ImagePickerService>((ref) {
  return ImagePickerService();
});
