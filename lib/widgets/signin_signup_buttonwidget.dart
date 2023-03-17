import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';

class SignInSignUpButton extends StatelessWidget {
  const SignInSignUpButton(
      {super.key, this.onTap, required this.isLogin, this.isChecking = false});

  final void Function()? onTap;
  final bool isLogin;
  final bool isChecking;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black26;
              }
              return Colors.white;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)))),
        child: !isChecking
            ? Text(
                isLogin ? 'LOG IN' : 'SIGN UP',
                style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            : CupertinoActivityIndicator(
                radius: 13.r,
                color: ThemeConstents.appPrimeryColor,
              ),
      ),
    );
  }
}
