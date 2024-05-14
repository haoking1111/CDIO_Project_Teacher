import 'dart:convert';
import 'package:cdio_project/common/toast.dart';
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:cdio_project/controller/teacher_controller.dart';
import 'package:cdio_project/model/teacher/teacher_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../common/api_url.dart';
import '../model/child/list_child_class_model.dart';

class ListChildClassController extends GetxController {
  var listChild = Rx<List<ListChild>>([]);
  var isLoading = true.obs;


  final TeacherController teacherController = Get.find<TeacherController>();

  @override
  void onInit() {
    super.onInit();
    fetchChildrenByClassroom();
  }

  fetchChildrenByClassroom() async {
    //doi
    await teacherController.fetchTeacher();

    Teacher teacher = teacherController.teacher.value;
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request('GET',
          Uri.parse('${ApiUrl.getChildInClassUrl}/${teacher.classroomIds}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Parse JSON data
        final data = await response.stream.bytesToString();
        if (data.startsWith('[')) {
          final jsonData = jsonDecode(data) as List<dynamic>;
          listChild.value = jsonData
              .map((item) => ListChild.fromJson(item as Map<String, dynamic>))
              .toList();
        }

        isLoading.value = false;

        update();
      } else {
         Get.snackbar('Error loading data',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    } catch (e) {
      showToast(message: 'Error');
    }
  }
}
