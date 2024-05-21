
import 'dart:convert';
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../common/api_url.dart';
import '../common/toast.dart';
import '../model/teacher/teacher_model.dart';

class TeacherController extends GetxController{
  var teacher = Teacher().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeacher();
  }

  fetchTeacher() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET', Uri.parse(ApiUrl.getTeacherUrl));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read data from response
        final data = await response.stream.bytesToString();
        // Decode JSON into a Map<String, dynamic>
        Map<String, dynamic> jsonData = jsonDecode(data);
        final teacherData = Teacher.fromJson(jsonData);



        // Lưu dữ liệu vào biến parent
        teacher.value = teacherData;

        isLoading.value = false;

        update();



      } else {
         Get.snackbar(
            'Error loading data',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}'
        );
      }
    } catch (e) {
      showToast(message: 'Error');
    }
  }

  updateTeacher(String fullNameController, String phoneNumberController, String emailController,
      String addressController) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await AuthController.readToken()}'
    };
    var request = http.Request(
        'PUT',
        Uri.parse(
            '${ApiUrl.updateTeacherInfUrl}/${await AuthController.readUserId()}'));

    request.body = json.encode({
      "fullName": fullNameController,
      "phoneNumber": phoneNumberController,
      "email": emailController,
      "address": addressController,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      Future.delayed(const Duration(seconds: 1),() {
        // Call Getx to update the parent data and reload the page
        Get.find<TeacherController>().fetchTeacher();
        Get.back();
        showToast(message: 'Cập nhật thông tin thành công');
      },
      );
    } else {
    }
  }
}
