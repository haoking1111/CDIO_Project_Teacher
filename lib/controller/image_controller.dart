import 'package:cdio_project/common/api_url.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'auth_controller.dart';

class PostImageController extends GetxController {
  final picker = ImagePicker();
  var selectedImagePath = ''.obs;
  var selectedChild = ''.obs;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  Future<void> uploadImage(String childId) async {
    if (selectedImagePath.value.isEmpty) {
      Get.snackbar('Lỗi', 'Không có tấm ảnh nào');
      return;
    }

    var headers = {
      'Authorization': 'Bearer ${await AuthController.readToken()}'
    };
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(ApiUrl.postImageUrl)
    );
    request.fields.addAll({
      'childId': childId
    });
    request.files.add(await http.MultipartFile.fromPath('image', selectedImagePath.value));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print(response.statusCode);

    if (response.statusCode == 201) {
      Get.snackbar('Thành Công', 'Ảnh đã được đăng lên thành công');
    } else {
      Get.snackbar('Lỗi', 'Không tải được ảnh lên');
    }
  }
}
