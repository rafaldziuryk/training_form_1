import 'package:flutter/material.dart';
import 'package:form_1/page1/checkbox_form_field.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final formKey = GlobalKey<FormState>();

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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
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
              if (formKey.currentState?.validate() ?? false) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Validated')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error')));
              }
            },
            child: Text('validate'),
          ),
        ],
      ),
    );
  }
}
