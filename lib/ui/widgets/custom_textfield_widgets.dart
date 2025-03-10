import 'package:flutter/material.dart';

class CustomTextFieldWidgets extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String labelText;
  const CustomTextFieldWidgets({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        validator: (value) => value!.isEmpty ? "Please Enter Field" : null,
      ),
    );
  }
}
