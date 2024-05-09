import 'package:cdio_project/controller/child_controller.dart';
import 'package:cdio_project/controller/class_controller.dart';
import 'package:cdio_project/model/parent/parent_model.dart';
import 'package:cdio_project/view/ui/post_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/parent_controller.dart';
import '../../model/child/child_model.dart';
import '../../model/class/class_model.dart';
import 'album_page.dart';
import 'comments_teacher_page.dart';
import 'medicine_page.dart';
import 'message_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerParent = Get.put<ParentController>(ParentController());

    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.teal,
        ),
        body: Obx(() {
          if(controllerParent.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if(controllerParent.parent.value!=null ) {
              Parent parent = controllerParent.parent.value!;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Column(children: [
// header
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/background.png',
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 5, right: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
//Icon menu
                                Builder(
                                  builder: (context) => IconButton(
                                      onPressed: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                      icon: const Icon(
                                        Icons.menu_outlined,
                                        color: Colors.white,
                                        size: 25,
                                      )
                                  ),
                                ),

                                Expanded(child: Container()),

//Icon find
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search_outlined,
                                      color: Colors.white,
                                      size: 25,
                                    )),

//Icon notifi
                                IconButton(
                                    onPressed: () {

                                    },
                                    icon: const Icon(
                                      Icons.notifications_active_outlined,
                                      color: Colors.white,
                                      size: 25,
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 112,
                              decoration: BoxDecoration(
// color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.white.withOpacity(0.13)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.black.withOpacity(0.3)
                                      ]
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Sự Kiệm Sắp Tới',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Trại Hè Rám Nắng',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Thời gian dự kiến: ',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '30/4/2024',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Địa điểm: ',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Hòa An Farm Sơn Trà, Đà Nẵng',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Expanded(child: Container()),

                                    IconButton(
                                        onPressed: () {

                                        },
                                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 25,)
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

// body
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
// navigator
                            Container(
                              height: 85,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 6,
                                        offset: const Offset(0, 2))
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
//Message
                                        Column(
                                          children: [
                                            RawMaterialButton(
                                              onPressed: () {
                                                Get.to(()=> const MessagePage());
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.lightBlue[50],
                                              padding: const EdgeInsets.all(10.0),
                                              shape: const CircleBorder(),
                                              child: Icon(
                                                Icons.message_outlined,
                                                color: Colors.teal[700],
                                              ),
                                            ),
                                            const Text(
                                              'Nhắn Tin',
                                              style: TextStyle(
                                                  fontSize: 15, fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),

//medicine
                                        Column(
                                          children: [
                                            RawMaterialButton(
                                              onPressed: () {
                                                Get.to(()=> MedicinePage());
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.lightBlue[50],
                                              padding: const EdgeInsets.all(10.0),
                                              shape: const CircleBorder(),
                                              child: Icon(
                                                Icons.add_alert,
                                                color: Colors.teal[700],
                                              ),
                                            ),
                                            const Text(
                                              'Dặn Thuốc',
                                              style: TextStyle(
                                                  fontSize: 15, fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),

//Album
                                        Column(
                                          children: [
                                            RawMaterialButton(
                                              onPressed: () {
                                                Get.to(()=> const AlbumPage());
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.lightBlue[50],
                                              padding: const EdgeInsets.all(10.0),
                                              shape: const CircleBorder(),
                                              child: Icon(
                                                Icons.photo_outlined,
                                                color: Colors.teal[700],
                                              ),
                                            ),
                                            const Text(
                                              'Album',
                                              style: TextStyle(
                                                  fontSize: 15, fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),

//Comment
                                        Column(
                                          children: [
                                            RawMaterialButton(
                                              onPressed: () {
                                                Get.to(()=>const CommentsTeacherPage());
                                              },
                                              elevation: 2.0,
                                              fillColor: Colors.lightBlue[50],
                                              padding: const EdgeInsets.all(10.0),
                                              shape: const CircleBorder(),
                                              child: Icon(
                                                Icons.article_rounded,
                                                color: Colors.teal[700],
                                              ),
                                            ),
                                            const Text(
                                              'Nhận Xét',
                                              style: TextStyle(
                                                  fontSize: 15, fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),

//infor
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 6,
                                        offset: const Offset(0, 2))
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
//image
                                    Column(
                                      children: [
                                        Container(
                                          height: 115,
                                          width: 115,
                                          decoration: BoxDecoration(
                                              color: Colors.redAccent,
                                              borderRadius: BorderRadius.circular(50),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/imageinfor.png'),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
// text infor
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
// name
                                        Row(
                                          children: [
                                            Text(
                                              'Cô Giáo: ',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text (
                                              '${parent.fullName}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),

//Class
                                        Row(
                                          children: [
                                            Text(
                                              'Lớp: ',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              'Chồi Non',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),

// Age
                                        Row(
                                          children: [
                                            Text(
                                              'Số Điện Thoại: ',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              '${parent.phoneNumber}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 15,
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
                                    Get.to(()=> const PostPage());
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
                                      style: TextStyle(fontSize: 14, color: Colors.white),
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
                                      style: TextStyle(fontSize: 14, color: Colors.black),
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
                                      style: TextStyle(fontSize: 14, color: Colors.black),
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
                                      style: TextStyle(fontSize: 14, color: Colors.black),
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
                                                image:
                                                AssetImage('assets/images/montess.png'),
                                                fit: BoxFit.fill),
                                          ),
                                          child: const Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Mon',
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(
                                                        'tess',
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight: FontWeight.bold),
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
                                                        style: TextStyle(fontSize: 15),
                                                      ),
                                                      Text(
                                                        'nhỏ đến lớn',
                                                        style: TextStyle(fontSize: 15),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                      ),

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
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 0,
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 2))
                                            ],
                                            color: Colors.white
                                        ),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 20,),
                                            Container(
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.teal[400],
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                child: Text(
                                                  'Phương pháp Montess',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white
                                                  ),
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
                                                    fontWeight: FontWeight.w500
                                                ),
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
                                                image:
                                                AssetImage('assets/images/support1.png'),
                                                fit: BoxFit.fill),
                                          ),
                                          child: const Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Ăn',
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(
                                                        'uống',
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight: FontWeight.bold),
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
                                                        style: TextStyle(fontSize: 15),
                                                      ),
                                                      Text(
                                                        '1 đến 3 tuổi',
                                                        style: TextStyle(fontSize: 15),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                      ),

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
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 0,
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 2))
                                            ],
                                            color: Colors.white
                                        ),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 20,),
                                            Container(
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.teal[400],
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                child: Text(
                                                  'Cách ăn uống',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white
                                                  ),
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
                                                    fontWeight: FontWeight.w500
                                                ),
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
                                                image:
                                                AssetImage('assets/images/montess.png'),
                                                fit: BoxFit.fill),
                                          ),
                                          child: const Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        'Mon',
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                      Text(
                                                        'tess',
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontWeight: FontWeight.bold),
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
                                                        style: TextStyle(fontSize: 15),
                                                      ),
                                                      Text(
                                                        'nhỏ đến lớn',
                                                        style: TextStyle(fontSize: 15),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                      ),

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
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 0,
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 2))
                                            ],
                                            color: Colors.white
                                        ),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 20,),
                                            Container(
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.teal[400],
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                child: Text(
                                                  'Phương pháp Montess',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white
                                                  ),
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
                                                    fontWeight: FontWeight.w500
                                                ),
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

                            const SizedBox(
                              height: 10,
                            ),

//support
                            Container(
                              height: 190,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 6,
                                        offset: const Offset(0, 2))
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.lightBlue[50]),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Hỗ trợ khám',
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                        const Text(
                                          'sức khỏe định',
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                        const Text(
                                          'kỳ cho bé',
                                          style: TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {

                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.teal[500],
                                          ),
                                          child: const Text(
                                            'GỌI NGAY',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(15),
                                                topRight: Radius.circular(15)),
                                            image: DecorationImage(
                                                image:
                                                AssetImage('assets/images/support.png'),
                                                fit: BoxFit.cover)),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              );
            } else {
              return Center(
                child: Text('Du lieu khong ton tai'),
              );
            }
          }
        },)
    );;
  }
}


