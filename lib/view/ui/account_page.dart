import 'dart:async';

import 'package:cdio_project/controller/class_controller.dart';
import 'package:cdio_project/view/ui/post_page.dart';
import 'package:cdio_project/view/ui/update_teacher_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/teacher_controller.dart';
import '../../model/class/class_model.dart';
import '../../model/teacher/teacher_model.dart';
import 'login_parent_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final controllerTeacher = Get.put<TeacherController>(TeacherController());
  final classController = Get.put<ClassController>(ClassController());

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Timer _timer; // Khai báo timer ở đây

  @override
  void initState() {
    super.initState();
    // Khởi tạo timer trong phương thức initState
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      controllerTeacher.fetchTeacher();
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Hủy bỏ timer trong phương thức dispose
    _timer.cancel();
  }

  Future<void> clearDataAndCloseRoutes() async {
    // Xóa dữ liệu
    final SharedPreferences? prefs = await _prefs;
    prefs?.clear();
    // Đóng tất cả các controller và route
    Get.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controllerTeacher.isLoading.value ||
            classController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          Teacher teacher = controllerTeacher.teacher.value;
          Class classInf = classController.classInf.value;
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.teal,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 180),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 120,
                          ),

//image
                          Column(
                            children: [
                              Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 8,
                                          offset: const Offset(0, 2))
                                    ],
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/teacher.png',
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${teacher.fullName}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Lớp: ${classInf.name}',
                              )
                            ],
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          const Divider(
                            color: Colors.black,
                          ),

                          const SizedBox(
                            height: 15,
                          ),

                          Container(
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
//name parent
                                  Row(
                                    children: [
//icon
                                      Icon(
                                        Icons.supervisor_account_outlined,
                                        color: Colors.teal,
                                        size: 20,
                                      ),

//address
                                      Text(
                                        ' Họ Tên: ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),

                                      Text(
                                        '${teacher.fullName}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

//phone number
                                  Row(
                                    children: [
//icon
                                      Icon(
                                        Icons.phone,
                                        color: Colors.teal,
                                        size: 20,
                                      ),

//address
                                      Text(
                                        ' Số Điện Thoại: ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),

                                      Text(
                                        '${teacher.phoneNumber}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

//address
                                  Row(
                                    children: [
//icon
                                      Icon(
                                        Icons.house,
                                        color: Colors.teal,
                                        size: 20,
                                      ),

//address
                                      Text(
                                        ' Địa Chỉ: ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),

                                      Text(
                                        '${teacher.address}',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        overflow: TextOverflow.visible,
                                      ),
                                    ],
                                  ),

                                  const SizedBox(
                                    height: 10,
                                  ),

                                  Row(
                                    children: [
//icon
                                      Icon(
                                        Icons.email,
                                        color: Colors.teal,
                                        size: 20,
                                      ),

//address
                                      Text(
                                        ' Email: ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),

                                      Text(
                                        '${teacher.email}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  Expanded(child: Container()),

//Update
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => UpdateTeacherPage());
                                        },
                                        child: Text(
                                          'Cập Nhật',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue[300]),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

//logout
                          GestureDetector(
                            onTap: () async {
                              // // Xóa dữ liệu và đóng route trước khi chuyển đến trang đăng nhập
                              // await clearDataAndCloseRoutes();
                              // //dung time
                              // _timer.cancel();
                              // // Chuyển đến trang đăng nhập
                              // await Get.offAll(() => const LoginParentPage());
                              Get.dialog(AlertDialog(
                                backgroundColor: Colors.teal[400],
                                title: Text(
                                  'Đăng Xuất',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                content: Text(
                                  'Bạn có muốn đăng xuất không ?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        'Hủy',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                  TextButton(
                                      onPressed: () async {
                                        // Xóa dữ liệu và đóng route trước khi chuyển đến trang đăng nhập
                                        await clearDataAndCloseRoutes();
                                        //dung time
                                        _timer.cancel();
                                        // Chuyển đến trang đăng nhập
                                        await Get.offAll(
                                            () => const LoginParentPage());
                                        Get.back();
                                      },
                                      child: Text(
                                        'Đăng xuất',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )),
                                ],
                              ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.logout,
                                  size: 20,
                                  color: Colors.teal,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Đăng Xuất',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

//post
                          Row(
                            children: [
                              const Text(
                                'Bài viết',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(child: Container()),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const PostPage());
                                },
                                child: const Text(
                                  'Xem tất cả',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.lightBlueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            height: 30,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal[500],
                                  ),
                                  child: const Text(
                                    'Montess',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[100],
                                  ),
                                  child: const Text(
                                    'Từ 1 đến 3 tuổi',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[100],
                                  ),
                                  child: const Text(
                                    'Cách ăn uống',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey[100],
                                  ),
                                  child: const Text(
                                    'Bé tập đi',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 130,
                            color: Colors.white,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 310,
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/montess.png'),
                                              fit: BoxFit.fill),
                                        ),
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Mon',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      'tess',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(Icons.forward),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Cho bé từ',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      'nhỏ đến lớn',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                    Container(
                                      height: 25,
                                      width: 310,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 0,
                                                blurRadius: 6,
                                                offset: const Offset(0, 2))
                                          ],
                                          color: Colors.white),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.teal[400],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text(
                                                'Phương pháp Montess',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                          const Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              'Xem chi tiết',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 310,
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/support1.png'),
                                              fit: BoxFit.fill),
                                        ),
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Ăn',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      'uống',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(Icons.forward),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Cho bé từ',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      '1 đến 3 tuổi',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                    Container(
                                      height: 25,
                                      width: 310,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 0,
                                                blurRadius: 6,
                                                offset: const Offset(0, 2))
                                          ],
                                          color: Colors.white),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.teal[400],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text(
                                                'Cách ăn uống',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                          const Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              'Xem chi tiết',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 310,
                                        height: 100,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/montess.png'),
                                              fit: BoxFit.fill),
                                        ),
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Mon',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      'tess',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Icon(Icons.forward),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      'Cho bé từ',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      'nhỏ đến lớn',
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        )),
                                    Container(
                                      height: 25,
                                      width: 310,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 0,
                                                blurRadius: 6,
                                                offset: const Offset(0, 2))
                                          ],
                                          color: Colors.white),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: Colors.teal[400],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text(
                                                'Phương pháp Montess',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                          const Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: Text(
                                              'Xem chi tiết',
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
