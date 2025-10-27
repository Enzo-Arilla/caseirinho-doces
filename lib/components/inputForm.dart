import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final String hintText;
  final bool enabled;

  final TextEditingController? controller;

  const InputForm({
    this.controller,
    required this.hintText,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[400]),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Color(0xFFF96697),
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        enabled: enabled,
      ),
      onSaved: (String? value) {

      },
      validator: (String? value) {
        if (value == null || value == "")
          return "O campo ${hintText.toLowerCase()} não pode ser vazio";
        else
          return null;
      },
    );
  }
}
