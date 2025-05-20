import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationComplete extends StatefulWidget {
  const RegistrationComplete({Key? key}) : super(key: key);

  @override
  State<RegistrationComplete> createState() => _RegistrationCompleteState();
}

class _RegistrationCompleteState extends State<RegistrationComplete> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? gender;
  DateTime? birthDate;

  void _selectDate() async {
    DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null && picked != birthDate) {
      setState(() {
        birthDate = picked;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && gender != null && birthDate != null) {
      // يمكنك هنا إرسال البيانات إلى الخادم أو حفظها
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('تم التسجيل'),
          content: Text(
              'الاسم: ${nameController.text}\nالجنس: $gender\nتاريخ الميلاد: ${birthDate!.toLocal().toString().split(' ')[0]}'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى ملء جميع الحقول')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل حساب'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'الاسم الثلاثي'),
                validator: (value) =>
                value!.isEmpty
                    ? 'أدخل الاسم الثلاثي'
                    : null,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'كلمة المرور'),
                obscureText: true,
                validator: (value) =>
                value!.isEmpty
                    ? 'أدخل كلمة المرور'
                    : null,
              ),
              const SizedBox(height: 16),
              const Text('الجنس'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('ذكر'),
                      value: 'ذكر',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('أنثى'),
                      value: 'أنثى',
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('تاريخ الميلاد: '),
                  Text(birthDate != null
                      ? birthDate!.toLocal().toString().split(' ')[0]
                      : 'لم يتم التحديد'),
                  const Spacer(),
                  MaterialButton(onPressed:_selectDate,
                    child: const Text('اختر التاريخ'),)

                ],
              ),
              const SizedBox(height: 24),
              MaterialButton(onPressed:_submitForm,
                child: const Text('تسجيل'),)

            ],
          ),
        ),
      ),);
  }}