//
// import 'dart:convert';
// import 'package:cdio_project/controller/auth_controller.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import '../common/api_url.dart';
// import '../model/child/child_model.dart';
//
// class ChildController extends GetxController{
//   var child = Child().obs;
//   var isLoading = true.obs;
//
//   static final Future<SharedPreferences> _preferences =
//   SharedPreferences.getInstance();
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchChild();
//   }
//
//   fetchChild() async {
//
//     try {
//       var headers = {
//         'Authorization': 'Bearer ${await AuthController.readToken()}'
//       };
//       var request = http.Request(
//           'GET', Uri.parse('${ApiUrl.getChildUrl}/${await AuthController.readUserId()}'));
//
//       request.headers.addAll(headers);
//
//       http.StreamedResponse response = await request.send();
//
//       if (response.statusCode == 200) {
//         // Read data from response
//         final data = await response.stream.bytesToString();
//         // Decode JSON into a Map<String, dynamic>
//         Map<String, dynamic> jsonData = jsonDecode(data);
//         final childData = Child.fromJson(jsonData);
//
//         child.value = childData;
//
//         isLoading.value = false;
//
//         update();
//
//         print(child.value.fullName);
//         print(child.value.age);
//         print('teacherId: ${child.value.teacherId}');
//         print('classid: ${child.value.classroomId.toString()}');
//
//
//       } else {
//         await Get.snackbar(
//             'Error loading data',
//             'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}'
//         );
//       }
//     } catch (e) {
//       print('error: ' + e.toString());
//       // or throw an exception
//     }
//   }
//
// }
