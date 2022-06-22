import 'package:flutter/material.dart';
import 'package:form_1/page4/checkbox_form_field.dart';
import 'package:form_1/page4/custom_validator.dart';
import 'package:dio/dio.dart';

class PageFour extends StatefulWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  final formKey = GlobalKey<FormState>();
  final login = TextEditingController();
  final password = TextEditingController();
  final loginValidator = CustomValidator<String>((value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: loginValidator,
                  controller: login,
                ),
                TextFormField(
                  validator: loginValidator,
                  controller: password,
                ),
                CheckboxFormField(
                  title: Text('Regulations'),
                  onSaved: (_) {},
                  validator: (checked) => checked == true ? null : 'Regulations need to be accepted',
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final dio = Dio();
              try {
                final result = await dio.get('https://trainingserver1.herokuapp.com/login', queryParameters: {
                  'login': login.text,
                  'password': password.text,
                });
                loginValidator.externalError = null;
                formKey.currentState?.validate();
              } catch (e) {
                final error = e as DioError;
                if (error.response?.statusCode == 404) {
                  loginValidator.externalError = 'Auth failed';
                  formKey.currentState?.validate();
                }
              }
            },
            child: Text('validate'),
          ),
        ],
      ),
    );
  }
}
