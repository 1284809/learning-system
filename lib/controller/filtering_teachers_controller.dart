import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FilteringTeachersController extends GetxController {
  var isloading = false.obs;
  var teachers = [].obs;

  Future<void> getFilteringTeachers() async {
    isloading.value = true;

    final url = Uri.parse('https://             ');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        teachers.value = data['teachers'];
      } else {
        Get.snackbar('خطأ', 'فشل في تحميل البيانات');
      }
    } catch (e) {
      Get.snackbar('حدث خطأ $e', 'الرجاء المحاولة لاحقاً');
      print(e);
    } finally {
      isloading.value = false;
    }
  }
}
