import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled3/controller/stages_controller.dart';

class StageScreen extends StatelessWidget {
  final StagesController controller = Get.put(StagesController());

  @override
  Widget build(BuildContext context) {
    controller.getStages();

    return Scaffold(
      appBar: AppBar(title: Text('المرحلة الدراسية والجامعة')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // المرحلة
                Text('اختر المرحلة'),
                DropdownButton<String>(
                  isExpanded: true,
                  value: controller.selectedStage.value.isEmpty
                      ? null
                      : controller.selectedStage.value,
                  items: controller.stages
                      .map((stage) => DropdownMenuItem(
                            value: stage,
                            child: Text(stage),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.selectedStage.value = value!;
                    controller.resetSelections();
                  },
                ),

                const SizedBox(height: 20),

                // إذا كانت المرحلة "جامعي"
                if (controller.selectedStage.value == 'جامعي') ...[
                  Text('اختر الجامعة'),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: controller.selectedUniversity.value.isEmpty
                        ? null
                        : controller.selectedUniversity.value,
                    items: controller.universities
                        .map((uni) => DropdownMenuItem(
                              value: uni,
                              child: Text(uni),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedUniversity.value = value!;
                      controller.selectedCollege.value = '';
                      controller.selectedSubject.value = '';
                    },
                  ),
                  const SizedBox(height: 20),
                  if (controller.selectedUniversity.value.isNotEmpty) ...[
                    Text('اختر الكلية'),
                    DropdownButton<String>(
                      isExpanded: true,
                      value: controller.selectedCollege.value.isEmpty
                          ? null
                          : controller.selectedCollege.value,
                      items: controller.colleges
                          .map((col) => DropdownMenuItem(
                                value: col,
                                child: Text(col),
                              ))
                          .toList(),
                      onChanged: (value) {
                        controller.selectedCollege.value = value!;
                        controller.selectedSubject.value = '';
                      },
                    ),
                  ],
                  const SizedBox(height: 20),
                  if (controller.selectedCollege.value.isNotEmpty) ...[
                    Text('المواد:'),
                    Wrap(
                      spacing: 8,
                      children: controller
                          .getSubjectsForCollege()
                          .map((subject) => Chip(label: Text(subject)))
                          .toList(),
                    ),
                  ],
                ]
                // إن لم تكن جامعي → عرض المرحلة المدرسية
                else if (controller.selectedStage.value.isNotEmpty) ...[
                  Text('اختر الصف'),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: controller.selectedGrade.value.isEmpty
                        ? null
                        : controller.selectedGrade.value,
                    items:
                        (controller.allGrades[controller.selectedStage.value] ??
                                [])
                            .map((grade) => DropdownMenuItem(
                                  value: grade,
                                  child: Text(grade),
                                ))
                            .toList(),
                    onChanged: (value) {
                      controller.selectedGrade.value = value!;
                      controller.selectedSubject.value = '';
                    },
                  ),
                  const SizedBox(height: 20),
                  if (controller.selectedGrade.value.isNotEmpty) ...[
                    Text('المواد:'),
                    Wrap(
                      spacing: 8,
                      children: controller
                          .getSubjectsForSelectedGrade()
                          .map((subject) => Chip(label: Text(subject)))
                          .toList(),
                    ),
                  ],
                ],
              ],
            ),
          );
        }),
      ),
    );
  }
}
