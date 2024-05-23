import 'dart:convert';
import 'package:cdio_project/common/api_url.dart';
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:cdio_project/model/comment/comment_for_child.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common/toast.dart';

class CommentController extends GetxController {
  var commentForChild = Rx<List<CommentForChild>>([]);
  var isLoading = true.obs;

  fetchCommentForChild(String childId) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET',
          Uri.parse('${ApiUrl.getAllCommentForChild}/$childId')
      );

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print(response.statusCode);
      print(response);

      if (response.statusCode == 200) {
        final data = await response.stream.bytesToString();
        if (data.startsWith('[')) {
          final jsonData = jsonDecode(data) as List<dynamic>;
          commentForChild.value = jsonData.map((item) => CommentForChild.fromJson(item as Map<String, dynamic>)).toList();
        } else {
          final jsonData = jsonDecode(data) as Map<String, dynamic>;
          commentForChild.value = [CommentForChild.fromJson(jsonData)];
        }

        isLoading.value = false;

        update();

      } else {
        Get.snackbar(
            'Error loading data',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}'
        );
      }

    } catch (e) {
      showToast(message: 'Error: ${e.toString()}');
    }
  }

  createCommentForChild(String comment, String postMonth, String childId) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'POST',
          Uri.parse(ApiUrl.creatCommentForChild));
      request.body = json.encode({
        "comment": comment,
        "postMonth": postMonth,
        "childId": childId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }

    } catch(e) {
      showToast(message: 'Error: ${e.toString()}');
    }
  }
}
