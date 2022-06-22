import 'package:flutter/material.dart';
import 'package:form_1/page3/checkbox_form_field.dart';
import 'package:form_1/page3/custom_validator.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  final formKey = GlobalKey<FormState>();
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: loginValidator,
                ),
                TextFormField(
                  validator: loginValidator,
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
            onPressed: () {
              final mockLoginFailed = true;

              if (formKey.currentState?.validate() ?? false) {
                if (mockLoginFailed) {
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
