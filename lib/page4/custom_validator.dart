import 'package:flutter/material.dart';

class CustomValidator<T> {
  final FormFieldValidator<T> validator;
  String? externalError;

  CustomValidator(this.validator);

  String? call(T? value) {
    return externalError ?? validator(value);
  }
}
