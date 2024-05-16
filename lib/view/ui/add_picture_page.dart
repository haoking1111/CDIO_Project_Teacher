import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../controller/image_controller.dart';
import '../../controller/list_child_class_controller.dart';
import '../../model/child/list_child_class_model.dart';

class AddPicturePage extends StatefulWidget {
  const AddPicturePage({Key? key}) : super(key: key);

  @override
  State<AddPicturePage> createState() => _AddPicturePageState();
}

class _AddPicturePageState extends State<AddPicturePage> {
  final PostImageController controller = Get.put(PostImageController());
  final ListChildClassController listChildController = Get.put(ListChildClassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chọn Ảnh Trẻ',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return controller.selectedImagePath.value.isEmpty
                  ? Text('Bạn hãy chọn 1 tấm ảnh', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                  : Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: FileImage(File(controller.selectedImagePath.value)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  icon: Icon(Icons.photo, color: Colors.white,),
                  label: Text('Bộ sưu tập', style: TextStyle(color: Colors.white),),
                  onPressed: () => controller.pickImage(ImageSource.gallery),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  icon: Icon(Icons.camera,color: Colors.white ),
                  label: Text('Chụp ảnh', style: TextStyle(color: Colors.white)),
                  onPressed: () => controller.pickImage(ImageSource.camera),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (listChildController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: listChildController.listChild.value.length,
                    itemBuilder: (context, index) {
                      ListChild child = listChildController.listChild.value[index];
                      return CheckboxListTile(
                        activeColor: Colors.teal,
                        title: Text(child.fullName ?? '', style: TextStyle(fontWeight: FontWeight.w700),),
                        subtitle: Text('Tuổi: ${child.age}', style: TextStyle(fontWeight: FontWeight.w600),),
                        value: controller.selectedChild.value == child.id.toString(),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              controller.selectedChild.value = child.id.toString();
                            } else {
                              controller.selectedChild.value = '';
                            }
                          });
                        },
                      );
                    },
                  );
                }
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    icon: Icon(Icons.upload, color: Colors.white),
                    label: Text('Tải ảnh lên', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      // Check if any child is selected
                      if (controller.selectedChild.value.isEmpty) {
                        Get.snackbar('Lỗi', 'Vui lòng chọn một học sinh');
                        return;
                      }
                      // Upload image with selected child ID
                      controller.uploadImage(controller.selectedChild.value);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
