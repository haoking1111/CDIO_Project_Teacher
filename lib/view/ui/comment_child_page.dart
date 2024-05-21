import 'package:cdio_project/controller/comment_for_child_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/child/list_child_class_model.dart';
import 'create_comment_for_child_page.dart';

class CommentChildPage extends StatefulWidget {
  final ListChild child;
  const CommentChildPage({super.key, required this.child});

  @override
  State<CommentChildPage> createState() => _CommentChildPageState();
}

class _CommentChildPageState extends State<CommentChildPage> {
  final commentForChildController = Get.put<CommentController>(CommentController());

  @override
  void initState() {
    super.initState();
    commentForChildController.fetchCommentForChild(widget.child.id.toString()); // fetch comments for the child
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        title: Text(
          'Nhận Xét Của Bé',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
            () {
          if (commentForChildController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (commentForChildController.commentForChild.value.isNotEmpty) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: commentForChildController.commentForChild.value.length,
                itemBuilder: (context, index) {
                  final commentForChildItem = commentForChildController.commentForChild.value[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tháng ${commentForChildItem.postMonth}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 4,
                                      blurRadius: 6,
                                      offset: const Offset(0, 2))
                                ],
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Nhận xét: ${commentForChildItem.comment}',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text('Khong co du lieu'),
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => CreateCommentForChildPage(childId: widget.child.id.toString())); // Convert childId to String
        },
        child: Icon(Icons.add, size: 30, color: Colors.white,),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
