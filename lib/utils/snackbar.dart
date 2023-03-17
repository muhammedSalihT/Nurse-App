import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';

class SnackBarWidget {
  static getSnackBar({context, String? showText}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ThemeConstents.appPrimeryColor,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(15),
        shape: const StadiumBorder(),
        content: Center(
          child: Text(
            showText!,
            style: TextStyle(
                fontSize: 14.sp,
                color: ThemeConstents.appBodyBlack,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
