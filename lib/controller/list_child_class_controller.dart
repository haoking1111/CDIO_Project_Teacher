import 'dart:convert';
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:cdio_project/controller/teacher_controller.dart';
import 'package:cdio_project/model/teacher/teacher_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../common/api_url.dart';
import '../model/child/list_child_class_model.dart';

class ListChildClassController extends GetxController {
  var listChil = Rx<List<ListChild>>([]);
  var isLoading = true.obs;

  static final Future<SharedPreferences> _preferences =
      SharedPreferences.getInstance();

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

      print(response.statusCode);
      if (response.statusCode == 200) {
        // Parse JSON data
        final data = await response.stream.bytesToString();
        if (data.startsWith('[')) {
          final jsonData = jsonDecode(data) as List<dynamic>;
          listChil.value = jsonData
              .map((item) => ListChild.fromJson(item as Map<String, dynamic>))
              .toList();
        }

        if (listChil.value.isNotEmpty) {
          // Access the first element (assuming single entry)
          print(listChil.value[0].id);
          print(listChil.value[0].height);
          print(listChil.value[0].weight);
          print(listChil.value[0].age);
          print(listChil.value[0].fullName);
          print(listChil.value[0].hobby);
          print('---------------------');

          print(listChil.value[1].id);
          print(listChil.value[1].height);
          print(listChil.value[1].weight);
          print(listChil.value[1].age);
          print(listChil.value[1].fullName);
          print(listChil.value[1].hobby);
        }

        isLoading.value = false;

        update();
      } else {
        await Get.snackbar('Error loading data',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    } catch (e) {
      print('error: ' + e.toString());
    }
  }
}
