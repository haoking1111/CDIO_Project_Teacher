
import 'dart:convert';
import 'package:cdio_project/common/toast.dart';
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:cdio_project/controller/teacher_controller.dart';
import 'package:cdio_project/model/class/class_model.dart';
import 'package:cdio_project/model/teacher/teacher_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../common/api_url.dart';

class ClassController extends GetxController{

  var classInf = Class().obs;
  var isLoading = true.obs;

  final TeacherController teacherController = Get.find<TeacherController>();

  @override
  void onInit() {
    super.onInit();
    fetchClass();
  }

  fetchClass() async {
    // Đợi cho hoạt động lấy thông tin co giao hoàn thành trước
    await teacherController.fetchTeacher();

    Teacher teacher = teacherController.teacher.value;
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET', Uri.parse('${ApiUrl.getClassByIdUrl}/${teacher.classroomIds}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Read data from response
        final data = await response.stream.bytesToString();
        // Decode JSON into a Map<String, dynamic>
        Map<String, dynamic> jsonData = jsonDecode(data);
        final classData =  Class.fromJson(jsonData);

        // Lưu dữ liệu vào biến parent
        classInf.value = classData;
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
}

