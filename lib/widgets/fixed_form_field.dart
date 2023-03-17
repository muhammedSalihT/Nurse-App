import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FixedFormField extends StatelessWidget {
  FixedFormField(
      {super.key, required this.initialvalue, this.labelText, this.padding});

  String initialvalue;
  String? labelText;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ?? EdgeInsets.only(left: 30.w, right: 30.w, bottom: 15.h),
      child: TextFormField(
        initialValue: initialvalue,
        enabled: false,
        decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
