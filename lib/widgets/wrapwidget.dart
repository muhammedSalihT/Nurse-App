import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WrapWidget extends StatelessWidget {
  WrapWidget({super.key, required this.firsttext, required this.secondtext});

  String firsttext;
  String secondtext;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          firsttext,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
        Text(
          secondtext,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
