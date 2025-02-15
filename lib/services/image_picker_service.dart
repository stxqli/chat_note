import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }
}