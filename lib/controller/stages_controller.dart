import 'package:get/get.dart';

class StagesController extends GetxController {
  var selectedStage = ''.obs;
  var selectedGrade = ''.obs;
  var selectedSubject = ''.obs;
  var selectedUniversity = ''.obs;
  var selectedCollege = ''.obs;

  // المراحل الدراسية
  final List<String> stages = ['ابتدائي', 'إعدادي', 'ثانوي', 'جامعي'];

  // الصفوف حسب المرحلة
  final Map<String, List<String>> allGrades = {
    'ابتدائي': ['الأول', 'الثاني', 'الثالث', 'الرابع', 'الخامس', 'السادس'],
    'إعدادي': ['السابع', 'الثامن', 'التاسع'],
    'ثانوي': ['العاشر', 'الحادي عشر', 'الثاني عشر'],
  };

  // المواد حسب الصف
  final Map<String, Map<String, List<String>>> schoolSubjects = {
    'ابتدائي': {
      'الأول': ['عربي', 'رياضيات', 'علوم', 'دين'],
      'الثاني': ['عربي', 'رياضيات', 'علوم', 'دين'],
      'الثالث': ['عربي', 'رياضيات', 'علوم', 'دين'],
      'الرابع': ['عربي', 'رياضيات', 'علوم', 'اجتماعيات'],
      'الخامس': ['عربي', 'رياضيات', 'علوم', 'اجتماعيات'],
      'السادس': ['عربي', 'رياضيات', 'علوم', 'اجتماعيات'],
    },
    'إعدادي': {
      'السابع': ['عربي', 'رياضيات', 'فيزياء', 'اجتماعيات'],
      'الثامن': ['عربي', 'رياضيات', 'فيزياء', 'كيمياء'],
      'التاسع': ['عربي', 'رياضيات', 'علوم', 'فيزياء', 'كيمياء'],
    },
    'ثانوي': {
      'العاشر': ['عربي', 'رياضيات', 'فيزياء', 'كيمياء'],
      'الحادي عشر': ['عربي', 'رياضيات', 'فيزياء', 'كيمياء', 'أحياء'],
      'الثاني عشر': ['عربي', 'رياضيات', 'فيزياء', 'كيمياء', 'فلسفة'],
    },
  };

  // الجامعات السورية
  final List<String> universities = [
    'جامعة دمشق',
    'جامعة حلب',
    'جامعة تشرين',
    'جامعة البعث',
    'جامعة الفرات',
    'جامعة حماة'
  ];

  // الكليات المشتركة
  final List<String> colleges = [
    'الطب البشري',
    'الهندسة المعلوماتية',
    'الحقوق',
    'الآداب',
    'الاقتصاد',
  ];

  // المواد الجامعية حسب الكلية (مثال مبسط)
  final Map<String, List<String>> universitySubjects = {
    'الطب البشري': ['تشريح', 'أدوية', 'أمراض', 'جراحة'],
    'الهندسة المعلوماتية': ['برمجة', 'هياكل بيانات', 'أنظمة تشغيل'],
    'الحقوق': ['مدني', 'جنائي', 'دستوري'],
    'الآداب': ['نحو', 'أدب جاهلي', 'بلاغة'],
    'الاقتصاد': ['اقتصاد جزئي', 'اقتصاد كلي', 'محاسبة'],
  };

  // دوال للمساعدة في عرض الخيارات حسب الاختيار الحالي
  List<String> getGradesForSelectedStage() {
    return allGrades[selectedStage.value] ?? [];
  }

  List<String> getSubjectsForSelectedGrade() {
    return schoolSubjects[selectedStage.value]?[selectedGrade.value] ?? [];
  }

  List<String> getSubjectsForCollege() {
    return universitySubjects[selectedCollege.value] ?? [];
  }

  // إعادة تعيين الاختيارات عند الرجوع للخلف أو تغيير المرحلة
  void resetSelections() {
    selectedGrade.value = '';
    selectedSubject.value = '';
    selectedUniversity.value = '';
    selectedCollege.value = '';
  }
}
