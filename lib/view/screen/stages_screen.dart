import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/controller/stages_controller.dart';

class StagesScreen extends StatelessWidget {
  final controller = Get.put(StagesController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // يجعل كل شيء من اليمين لليسار
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('اختيار المرحلة الدراسية')),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اختيار المرحلة
                DropdownButton<String>(
                  hint: Text("اختر المرحلة"),
                  value: controller.selectedStage.value == ''
                      ? null
                      : controller.selectedStage.value,
                  items: controller.stages
                      .map((stage) =>
                          DropdownMenuItem(value: stage, child: Text(stage)))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedStage.value = value!;
                    controller.resetSelections();
                  },
                ),

                // اختيار الصف إن لم تكن جامعي
                if (controller.selectedStage.value != '' &&
                    controller.selectedStage.value != 'جامعي')
                  DropdownButton<String>(
                    hint: Text("اختر الصف"),
                    value: controller.selectedGrade.value == ''
                        ? null
                        : controller.selectedGrade.value,
                    items: controller
                        .getGradesForSelectedStage()
                        .map((grade) =>
                            DropdownMenuItem(value: grade, child: Text(grade)))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedGrade.value = value!;
                      controller.selectedSubject.value = '';
                    },
                  ),

                // اختيار الجامعة إن كانت جامعي
                if (controller.selectedStage.value == 'جامعي')
                  DropdownButton<String>(
                    hint: Text("اختر الجامعة"),
                    value: controller.selectedUniversity.value == ''
                        ? null
                        : controller.selectedUniversity.value,
                    items: controller.universities
                        .map((uni) =>
                            DropdownMenuItem(value: uni, child: Text(uni)))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedUniversity.value = value!;
                      controller.selectedCollege.value = '';
                      controller.selectedSubject.value = '';
                    },
                  ),

                // اختيار الكلية
                if (controller.selectedStage.value == 'جامعي' &&
                    controller.selectedUniversity.value != '')
                  DropdownButton<String>(
                    hint: Text("اختر الكلية"),
                    value: controller.selectedCollege.value == ''
                        ? null
                        : controller.selectedCollege.value,
                    items: controller.colleges
                        .map((col) =>
                            DropdownMenuItem(value: col, child: Text(col)))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedCollege.value = value!;
                      controller.selectedSubject.value = '';
                    },
                  ),

                // اختيار المادة حسب المرحلة (مدرسي)
                if (controller.selectedStage.value != 'جامعي' &&
                    controller.selectedGrade.value != '')
                  DropdownButton<String>(
                    hint: Text("اختر المادة"),
                    value: controller.selectedSubject.value == ''
                        ? null
                        : controller.selectedSubject.value,
                    items: controller
                        .getSubjectsForSelectedGrade()
                        .map((subj) =>
                            DropdownMenuItem(value: subj, child: Text(subj)))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedSubject.value = value!;
                    },
                  ),

                // اختيار المادة الجامعية
                if (controller.selectedStage.value == 'جامعي' &&
                    controller.selectedCollege.value != '' &&
                    controller.getSubjectsForCollege().isNotEmpty)
                  DropdownButton<String>(
                    hint: Text("اختر المادة"),
                    value: controller.selectedSubject.value == ''
                        ? null
                        : controller.selectedSubject.value,
                    items: controller
                        .getSubjectsForCollege()
                        .map((subj) =>
                            DropdownMenuItem(value: subj, child: Text(subj)))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedSubject.value = value!;
                    },
                  ),

                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text('التالي'))
              ],
            );
          }),
        ),
      ),
    );
  }
}
