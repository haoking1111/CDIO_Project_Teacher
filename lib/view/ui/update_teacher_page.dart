import 'package:cdio_project/controller/teacher_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateTeacherPage extends StatefulWidget {
  const UpdateTeacherPage({super.key});

  @override
  State<UpdateTeacherPage> createState() => _UpdateTeacherPageState();
}

class _UpdateTeacherPageState extends State<UpdateTeacherPage> {
  final teacherController = Get.find<TeacherController>();

  bool isLoading = false;

  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController addressController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    var teacher = teacherController.teacher.value;
    fullNameController = TextEditingController(text: teacher.fullName);
    phoneNumberController = TextEditingController(text: teacher.phoneNumber);
    addressController = TextEditingController(text: teacher.address);
    emailController = TextEditingController(text: teacher.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    SizedBox(height: 55),
                    Center(
                      child: Container(
                        height: 500,
                        width: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 8,
                              blurRadius: 12,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                          child: Column(
                            children: [
                              // Thông tin
                              Text(
                                'Thông Tin',
                                style: TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              // Name
                              buildTextField(Icons.supervisor_account_outlined, 'Họ và tên', fullNameController),
                              SizedBox(height: 20),
                              // Phone number
                              buildTextField(Icons.phone, 'Số điện thoại', phoneNumberController),
                              SizedBox(height: 20),
                              // Address
                              buildTextField(Icons.home, 'Địa chỉ', addressController),
                              SizedBox(height: 20),
                              // Email
                              buildTextField(Icons.email, 'Email', emailController),
                              SizedBox(height: 50),
                              // Update button
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isLoading = true; // Set loading state to true before login call
                                  });
                                  await teacherController.updateTeacher(
                                    fullNameController.text.trim(),
                                    phoneNumberController.text.trim(),
                                    emailController.text.trim(),
                                    addressController.text.trim(),
                                  );
                                  Future.delayed(Duration(seconds: 1), () {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.teal[500],
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.lightBlue.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 500),
                                      transitionBuilder: (widget, animation) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: widget,
                                        );
                                      },
                                      child: isLoading
                                          ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                          : Text(
                                        'Cập nhật',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(IconData icon, String hint, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(icon, size: 25),
        Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            style: TextStyle(color: Colors.white),
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.white, fontSize: 15),
              fillColor: Colors.teal[300],
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
