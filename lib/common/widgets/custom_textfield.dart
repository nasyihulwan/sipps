import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Please enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
