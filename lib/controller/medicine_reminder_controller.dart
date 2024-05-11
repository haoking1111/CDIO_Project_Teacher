import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:cdio_project/controller/child_controller.dart';
import 'package:cdio_project/model/child/child_model.dart';
import 'package:cdio_project/model/medicine/medicine_reminder_model.dart';
import 'package:get/get.dart';
import '../common/api_url.dart';
import '../common/toast.dart';
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
          'GET', Uri.parse('${ApiUrl.getMedicineReminder}/${childId}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print(response.statusCode);

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

        if (medicineReminder.value.isNotEmpty) {
          // Access the first element (assuming single entry)
          print(medicineReminder.value[0].id);
          print(medicineReminder.value[0].comment);
          print(medicineReminder.value[0].currentStatus);
          print(medicineReminder.value[0].createdDay);
          print(medicineReminder.value[0].createdMonth);
          print(medicineReminder.value[0].createdYear);
          print('---------------------');

          print(medicineReminder.value[1].id);
          print(medicineReminder.value[1].comment);
          print(medicineReminder.value[1].currentStatus);
          print(medicineReminder.value[1].createdDay);
          print(medicineReminder.value[1].createdMonth);
          print(medicineReminder.value[1].createdYear);

        }


        isLoading.value = false;

        update();


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