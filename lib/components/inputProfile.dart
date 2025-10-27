import 'package:flutter/material.dart';

class InputProfile extends StatelessWidget {
  final String hintText;
  final bool enabled;
  final int? minLines, maxLines;

  const InputProfile({
    required this.hintText,
    required this.enabled,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.black), // cor do label
        filled: true,
        fillColor: Colors.brown.withOpacity(0.1), // fundo do campo
        enabledBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.brown, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.brown, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.brown, width: 2.5),
        ),
      ),
      style: TextStyle(color: Colors.black),
      enabled: enabled,
      minLines: this.minLines != null ? minLines : null,
      maxLines: this.maxLines != null ? maxLines : null,
      validator: (String? value) {
        if ((value == null || value == "")  && enabled == true)
          return "O campo ${hintText.toLowerCase()} não pode ser vazio";
        else
          return null;
      },
    );
  }
}
