import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/controller/filtering_teachers_controller.dart';

class FilteringTeachersScreen extends StatelessWidget {
  FilteringTeachersScreen({super.key});
  final controller = Get.put(FilteringTeachersController());

  @override
  Widget build(BuildContext context) {
    controller.getFilteringTeachers();

    return Scaffold(
      appBar: AppBar(title: Text(' الصفحة الرئيسية')),
      body: Obx(() {
        if (controller.isloading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.teachers.length,
            itemBuilder: (context, index) {
              var teacher = controller.teachers[index];
              return ListTile(
                title: Text(teacher['name']),
                subtitle: Text(teacher['spelication']),
                leading: Text(teacher['subject']),
                onTap: () {
                  // Get.to(() => );
                },
              );
            },
          );
        }
      }),
    );
  }
}
