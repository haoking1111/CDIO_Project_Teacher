
import 'package:cdio_project/controller/auth_controller.dart';
import 'package:cdio_project/view/ui/dashboard_page.dart';
import 'package:cdio_project/view/ui/login_parent_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MyApp()
  );
}
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindergarten Management System',
      home: FutureBuilder(
        future: AuthController.readToken(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.data == null) {
            return LoginParentPage();
          } else {
            Get.put(AuthController());
            return DashBoardPage();
          }
        },
      ),
    );
  }

}
