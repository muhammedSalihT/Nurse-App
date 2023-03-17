import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountFormField extends StatelessWidget {
  AccountFormField(
      {super.key,
      required this.status,
      required this.keyboardtype,
      this.readOnly,
      this.validation,
      this.onTap,
      this.maxLines,
      this.controller,
      this.hintText});

  bool status;
  TextInputType? keyboardtype;
  String? Function(String?)? validation;
  String? hintText;
  bool? readOnly;
  void Function()? onTap;
  TextEditingController? controller;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: TextFormField(
          maxLines: maxLines,
        controller: controller,
        onTap: onTap,
        readOnly: readOnly ?? false,
        validator: validation ??
            ((value) {
              if (value == null || value.isEmpty) {
                return "Enter $hintText";
              }
              return null;
            }),
        keyboardType: keyboardtype,
        enabled: status,
        decoration: InputDecoration(
            labelText: hintText,
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
