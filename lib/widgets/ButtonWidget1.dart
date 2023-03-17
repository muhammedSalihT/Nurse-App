import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';

class ButtonWidget1 extends StatelessWidget {
  ButtonWidget1({
    super.key,
    required this.buttonname,
    required this.height,
    required this.width,
    required this.onclick,
  });
  String buttonname;
  double? height;
  double? width;
  VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          onPressed: onclick,
          child: Text(
            buttonname,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          )),
    );
  }
}
