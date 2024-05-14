
import 'dart:convert';

import 'package:cdio_project/common/toast.dart';
import 'package:cdio_project/model/medicine/medicine_reminder_model.dart';
import 'package:get/get.dart';
import '../common/api_url.dart';
import 'auth_controller.dart';
import 'package:http/http.dart' as http;

class MedicineReminderController extends GetxController {
  var medicineReminder = Rx<List<MedicineReminder>>([]);
  var isLoading = true.obs;

  fetchMedicineReminder(String childId) async {

    try {
      var headers = {
        'Authorization': 'Bearer ${await AuthController.readToken()}'
      };
      var request = http.Request(
          'GET', Uri.parse('${ApiUrl.getMedicineReminder}/$childId'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Parse JSON data
        final data = await response.stream.bytesToString();
        if (data.startsWith('[')) {
          final jsonData = jsonDecode(data) as List<dynamic>;
          medicineReminder.value = jsonData.map((item) => MedicineReminder.fromJson(item as Map<String, dynamic>)).toList();
        } else {
          final jsonData = jsonDecode(data) as Map<String, dynamic>;
          medicineReminder.value = [MedicineReminder.fromJson(jsonData)];
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
      showToast(message: 'Error');
    }
  }

}