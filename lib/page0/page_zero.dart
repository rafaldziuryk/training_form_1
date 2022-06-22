import 'package:flutter/material.dart';

class PageZero extends StatefulWidget {
  const PageZero({Key? key}) : super(key: key);

  @override
  State<PageZero> createState() => _PageZeroState();
}

class _PageZeroState extends State<PageZero> {
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
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
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
