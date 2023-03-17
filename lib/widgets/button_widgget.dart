import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {super.key,
      required this.buttonname,
      required this.height,
      required this.width,
      this.isLoading = false,
      required this.onclick,
      this.textColor,
      this.loadingWidget,
      this.cupertinoColor,
      this.buttonColor});
  String buttonname;
  double? height;
  double? width;
  VoidCallback onclick;
  bool isLoading;
  Color? buttonColor;
  Color? textColor;
  Color? cupertinoColor;
  Widget? loadingWidget;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                buttonColor ?? ThemeConstents.appPrimeryColor)),
        onPressed: onclick,
        child: isLoading
            ? loadingWidget ??
                CupertinoActivityIndicator(
                  color: cupertinoColor ?? Colors.white,
                  radius: 12.r,
                )
            : Text(
                buttonname,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
    );
  }
}
