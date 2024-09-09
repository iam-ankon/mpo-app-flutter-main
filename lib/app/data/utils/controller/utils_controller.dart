import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class UtilsController extends GetxController {
  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
      );
      // setState(() {
      //   _setImageFileListFromFile(pickedFile);
      // });
    } catch (e) {
      // setState(() {
      //   _pickImageError = e;
      // });
    }
  }
}
