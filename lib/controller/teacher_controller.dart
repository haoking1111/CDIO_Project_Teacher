
import 'dart:convert';
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../common/api_url.dart';
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
        final teacherData = await Teacher.fromJson(jsonData);



        // Lưu dữ liệu vào biến parent
        teacher.value = teacherData;

        isLoading.value = false;

        update();

        print(teacher.value.fullName);
        print(teacher.value.phoneNumber);
        print(teacher.value.email);
        print(teacher.value.classroomIds);


      } else {
        await Get.snackbar(
            'Error loading data',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}'
        );
      }
    } catch (e) {
      print('error: ' + e.toString());
       // or throw an exception
    }
  }
}
