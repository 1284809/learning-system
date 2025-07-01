import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/controller/postcontroller.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});

  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController bodycontroller = TextEditingController();

  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: titlecontroller,
              decoration: InputDecoration(hintText: 'Add title'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: bodycontroller,
              decoration: InputDecoration(hintText: 'Add body'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = titlecontroller.text.trim();
                final body = bodycontroller.text.trim();

                if (title.isNotEmpty && body.isNotEmpty) {
                  controller.addpost(title, body);
                } else {
                  Get.snackbar('Error', 'Title and Body are required');
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
