import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({required this.controller, required this.hintText, required this.validator, super.key});
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;

  @override
  Widget build(final BuildContext context) => TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: validator,
    );
}
