import 'package:flutter/material.dart';

TextFormField reusableTextField(String text, IconData icon, bool isPasswodType,
    TextEditingController controller,
    {String? Function(String?)? validation,
    IconData? suffixIcon,
    bool isEmailType = true,
    void Function()? onSuffixPressed}) {
  return TextFormField(
    validator: controller.text.isNotEmpty
        ? validation
        : ((value) {
            if (value == null || value.isEmpty) {
              return text;
            }
            return null;
          }),
    controller: controller,
    obscureText: isPasswodType,
    enableSuggestions: !isPasswodType,
    autocorrect: !isPasswodType,
    cursorColor: Colors.white,
    decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black),
        suffixIcon: IconButton(
            onPressed: onSuffixPressed,
            icon: Icon(suffixIcon, color: Colors.black)),
        labelText: text,
        hintText: text,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType:
        isEmailType ? TextInputType.emailAddress : TextInputType.number,
  );
}
