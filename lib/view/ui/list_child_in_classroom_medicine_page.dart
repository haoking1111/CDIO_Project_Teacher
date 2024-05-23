

import 'package:cdio_project/controller/medicine_reminder_controller.dart';
import 'package:cdio_project/controller/message_controller.dart';
import 'package:cdio_project/view/ui/medicine_page.dart';
import 'package:flutter/material.dart';

import '../../controller/list_child_class_controller.dart';
import '../../model/child/list_child_class_model.dart';
import 'package:get/get.dart';

class ListChildInClassRoomMedicinePage extends StatefulWidget {
  const ListChildInClassRoomMedicinePage({super.key});

  @override
  State<ListChildInClassRoomMedicinePage> createState() => _ListChildInClassRoomMedicinePageState();
}

class _ListChildInClassRoomMedicinePageState extends State<ListChildInClassRoomMedicinePage> {
  final listChildController = Get.put(ListChildClassController());
  final medicineReminderController = Get.put<MedicineReminderController>(MedicineReminderController()); // Get the instance of MedicineReminderController
  final messageController = Get.put<MessageController>(MessageController());

  // late Timer _timer; // Khai báo timer ở đây
  //
  // @override
  // void initState() {
  //   super.initState();
  //   // Khởi tạo timer trong phương thức initState
  //   _timer = Timer.periodic(const Duration(seconds: 10), (_) {
  //     listChildController.fetchChildrenByClassroom();
  //
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   // Hủy bỏ timer trong phương thức dispose
  //   _timer.cancel();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(
          () {
        return SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 430,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      //icon back
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Icon(
                        Icons.library_books_rounded,
                        size: 100,
                        color: Colors.white,
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        width: 320,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 6,
                                  offset: const Offset(0, 2))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            children: [
                              Text(
                                'Danh sách trẻ em',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                // Add this line
                                scrollDirection: Axis.vertical,
                                itemCount:
                                listChildController.listChild.value.length,
                                itemBuilder: (context, index) {
                                  List<ListChild> children =
                                      listChildController.listChild.value;
                                  ListChild child = children[index];
                                  return GestureDetector(
                                      onTap: () {
                                        String childId = child.id.toString(); // Get the child id
                                        medicineReminderController.fetchMedicineReminder(childId); // Call the instance method
                                        ListChild childinf = listChildController.listChild.value[index];
                                        Get.to(()=> MedicinePage(child: childinf));
                                      },
                                      child: Column(
                                        children: [


                                          ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: AssetImage('assets/images/imageinfor.png'),
                                            ),
                                            title: Row(
                                              children: [
                                                Text(
                                                  'Tên: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w800),
                                                ),
                                                Text('${child.fullName}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),)
                                              ],
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Text(
                                                  'Tuổi: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w800,),
                                                ),
                                                Text('${child.age}',  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400))
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
