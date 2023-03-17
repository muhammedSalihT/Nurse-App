import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';

class FormFeildTitle extends StatelessWidget {
  FormFeildTitle({
    super.key,
    required this.title,
  });

  String title;

  @override
  Widget build(BuildContext context) {
    var Size = MediaQuery.of(context).size;

    return Column(
      children: [
        // SizedBox(
        //   height: 18.h,
        // ),
        Container(
          width: Size.width,
          height: 47,
          color: ThemeConstents.appPrimeryColor,
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: ThemeConstents.appBodyColor,
                fontSize: 20.sp),
          )),
        ),
      ],
    );
  }
}
