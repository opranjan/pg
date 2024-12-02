import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController fieldValue;

  CustomTextField({
    required this.label,
    required this.hint,
    required this.fieldValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldValue,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      autofocus: false, // Make sure autofocus is off to avoid jumping focus
      textAlign: TextAlign.left, // Ensures text is left-aligned
    );
  }
}
