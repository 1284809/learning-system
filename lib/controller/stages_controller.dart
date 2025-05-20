import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StagesController extends GetxController {
  // المتغيرات المرتبطة باختيارات المستخدم
  var selectedStage = ''.obs;
  var selectedGrade = ''.obs;
  var selectedSubject = ''.obs;
  var selectedUniversity = ''.obs;
  var selectedCollege = ''.obs;

  // بيانات المرحلة المدرسية والجامعية
  var stages = <String>[].obs;
  var allGrades = <String, List<String>>{}.obs;
  var schoolSubjects = <String, Map<String, List<String>>>{}.obs;
  var universities = <String>[].obs;
  var colleges = <String>[].obs;
  var universitySubjects = <String, List<String>>{}.obs;

  // جلب البيانات من الباك
  Future<void> getStages() async {
    var url = Uri.parse('');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // تعبئة البيانات
        stages.value = List<String>.from(data['stages']);

        allGrades.value = Map<String, List<String>>.fromEntries(
          (data['grades'] as Map).entries.map(
                (e) => MapEntry(e.key, List<String>.from(e.value)),
              ),
        );

        schoolSubjects.value =
            Map<String, Map<String, List<String>>>.fromEntries(
          (data['subjects'] as Map).entries.map(
                (e) => MapEntry(
                  e.key,
                  Map<String, List<String>>.fromEntries(
                    (e.value as Map).entries.map(
                          (grade) => MapEntry(
                            grade.key,
                            List<String>.from(grade.value),
                          ),
                        ),
                  ),
                ),
              ),
        );

        universities.value = List<String>.from(data['universities']);
        colleges.value = List<String>.from(data['colleges']);

        universitySubjects.value = Map<String, List<String>>.fromEntries(
          (data['universitySubjects'] as Map).entries.map(
                (e) => MapEntry(e.key, List<String>.from(e.value)),
              ),
        );
      } else {
        Get.snackbar('خطأ', 'فشل تحميل البيانات من السيرفر');
      }
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء جلب البيانات');
      print('Error: $e');
    }
  }

  // استرجاع الصفوف حسب المرحلة
  List<String> getGradesForSelectedStage() {
    return allGrades[selectedStage.value] ?? [];
  }

  // استرجاع المواد المدرسية حسب الصف
  List<String> getSubjectsForSelectedGrade() {
    return schoolSubjects[selectedStage.value]?[selectedGrade.value] ?? [];
  }

  // استرجاع مواد الجامعة حسب الكلية
  List<String> getSubjectsForCollege() {
    return universitySubjects[selectedCollege.value] ?? [];
  }

  // إعادة تعيين الاختيارات عند تغيير المرحلة
  void resetSelections() {
    selectedGrade.value = '';
    selectedSubject.value = '';
    selectedUniversity.value = '';
    selectedCollege.value = '';
  }
}
