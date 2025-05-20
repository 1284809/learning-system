import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class CompleteForm extends StatefulWidget {
  @override
  State<CompleteForm> createState() => _CompleteFormState();
}

class _CompleteFormState extends State<CompleteForm> {
  final _formKey = GlobalKey<FormState>();

  String? fullName;
  String? educationLevel;
  DateTime? birthDate;
  String? gender;
  File? profileImage;
  File? idImage;
  String? email;
  String? password;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(bool isProfile) async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isProfile) {
          profileImage = File(pickedFile.path);
        } else {
          idImage = File(pickedFile.path);
        }
      });
    }
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        birthDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("صفحة استكمال المعلومات")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // الاسم الثلاثي
                TextFormField(
                  decoration: InputDecoration(labelText: 'الاسم الثلاثي'),
                  onSaved: (value) => fullName = value,
                  validator: (value) =>
                  value!.isEmpty ? 'يرجى إدخال الاسم' : null,
                ),
                // المرحلة الدراسية
                TextFormField(
                  decoration: InputDecoration(labelText: 'المرحلة الدراسية'),
                  onSaved: (value) => educationLevel = value,
                ),
                // تاريخ الميلاد
                Row(
                  children: [
                    Text(
                      birthDate == null
                          ? "اختر تاريخ الميلاد"
                          : "${birthDate!.toLocal()}".split(' ')[0],
                    ),
                    Spacer(),
                    TextButton(
                      child: Text("اختيار"),
                      onPressed: _pickDate,
                    )
                  ],
                ),
                // الجنس
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: "الجنس"),
                  items: ['ذكر', 'أنثى'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) => gender = val,
                  validator: (val) =>
                  val == null ? "يرجى اختيار الجنس" : null,
                ),
                SizedBox(height: 10),
                // صورة شخصية
                Row(
                  children: [
                    Text("صورة شخصية: "),
                    Spacer(),
                    profileImage == null
                        ? Text("لم يتم اختيار صورة")
                        : Image.file(profileImage!, width: 50, height: 50),
                    IconButton(
                      icon: Icon(Icons.image),
                      onPressed: () => _pickImage(true),
                    ),
                  ],
                ),
                // الإيميل
                TextFormField(
                  decoration: InputDecoration(labelText: 'الإيميل'),
                  onSaved: (value) => email = value,
                  validator: (value) =>
                  value!.contains('@') ? null : 'إيميل غير صحيح',
                ),
                // كلمة المرور
                TextFormField(
                  decoration: InputDecoration(labelText: 'كلمة المرور'),
                  obscureText: true,
                  onSaved: (value) => password = value,
                  validator: (value) =>
                  value!.length < 6 ? 'كلمة المرور قصيرة جداً' : null,
                ),
                // صورة الهوية
                Row(
                  children: [
                    Text("صورة الهوية: "),
                    Spacer(),
                    idImage == null
                        ? Text("لم يتم اختيار صورة")
                        : Image.file(idImage!, width: 50, height: 50),
                    IconButton(
                      icon: Icon(Icons.image),
                      onPressed: () => _pickImage(false),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("تسجيل"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // يمكنك هنا تنفيذ أي منطق تسجيل أو حفظ البيانات
                      print("تم التسجيل بنجاح");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
