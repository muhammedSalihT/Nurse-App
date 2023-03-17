import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFormFieldWidget extends StatelessWidget {
  InputFormFieldWidget(
      {super.key,
      this.hinttext,
      required this.controller,
      required this.keyboardtype,
      this.maxLines,
      this.validation,
      this.onTap,
      this.readOnly,
      this.isValidating = true});

  String? hinttext;
  TextEditingController controller;
  TextInputType? keyboardtype;
  bool? isValidating;
  int? maxLines;
  String? Function(String?)? validation;
  void Function()? onTap;
  bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 15.h),
      child: TextFormField(
        readOnly: readOnly ?? false,
        onTap: onTap,
        maxLines: maxLines,
        keyboardType: keyboardtype,
        controller: controller,
        validator: validation ??
            (isValidating!
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter $hinttext";
                    }
                    return null;
                  }
                : (value) => null),
        decoration: InputDecoration(
            labelText: hinttext,
            hintText: hinttext,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }
}
