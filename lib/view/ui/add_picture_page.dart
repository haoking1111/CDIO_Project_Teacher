import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/image_controller.dart';

class AddPicturePage extends StatefulWidget {
  const AddPicturePage({super.key});

  @override
  State<AddPicturePage> createState() => _AddPicturePageState();
}

class _AddPicturePageState extends State<AddPicturePage> {
  final PostImageController controller = Get.put(PostImageController());

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
          children: [
            Obx(() {
              return controller.selectedImagePath.value.isEmpty
                  ? Text('Bạn hãy chọn 1 tấm ảnh', style: TextStyle(fontSize: 18))
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal
                  ),
                  icon: Icon(Icons.photo, color: Colors.white,),
                  label: Text('Bộ sưu tập', style: TextStyle(color: Colors.white),),
                  onPressed: () => controller.pickImage(ImageSource.gallery),
                ),
                SizedBox(width: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal
                  ),
                  icon: Icon(Icons.camera,color: Colors.white ),
                  label: Text('Chụp ảnh', style: TextStyle(color: Colors.white)),
                  onPressed: () => controller.pickImage(ImageSource.camera),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal
                  ),
                  icon: Icon(Icons.upload, color: Colors.white),
                  label: Text('Tải ảnh lên', style: TextStyle(color: Colors.white)),
                  onPressed: () => controller.uploadImage('10'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
