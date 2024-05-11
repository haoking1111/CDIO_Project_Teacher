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

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                  bottomRight: Radius.circular(20))),
          child: Stack(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
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
                        )),
                    SizedBox(
                      height: 55,
                    ),
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
                                  offset: const Offset(0, 2))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Column(
                            children: [
                              //thong tin
                              Text(
                                'Thông Tin',
                                style: TextStyle(
                                  fontSize: 29,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),

                              SizedBox(
                                height: 10,
                              ),

                              //name
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.supervisor_account_outlined,
                                    size: 30,
                                  ),
                                  Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      controller: fullNameController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        hintText: 'Họ và tên',
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                        fillColor: Colors.teal[300],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              //phoneNumber
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.phone,
                                    size: 25,
                                  ),
                                  Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      controller: phoneNumberController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        hintText: 'Số điện thoại',
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                        fillColor: Colors.teal[300],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              //address
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: 25,
                                  ),
                                  Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      controller: addressController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        hintText: 'Địa chỉ',
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                        fillColor: Colors.teal[300],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              //email
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.email,
                                    size: 25,
                                  ),
                                  Container(
                                    width: 250,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                        fillColor: Colors.teal[300],
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 50,
                              ),

                              //button update
                              GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    isLoading =
                                        true; // Set loading state to true before login call
                                  });
                                  Future.delayed(
                                    Duration(seconds: 1),
                                    () {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    },
                                  );

                                  await teacherController.updateParent(
                                      fullNameController.text.trim(),
                                      phoneNumberController.text.trim(),
                                      emailController.text.trim(),
                                      addressController.text.trim());
                                },
                                child: Container(
                                  height: 45,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.teal[500],
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.lightBlue.withOpacity(0.3),
                                          spreadRadius: 2,
                                          blurRadius: 8,
                                          offset: const Offset(0, 2))
                                    ],
                                  ),
                                  child: Center(
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      // Adjust animation duration as needed
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
                                                  color: Colors.white),
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
