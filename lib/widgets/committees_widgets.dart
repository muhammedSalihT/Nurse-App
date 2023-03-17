import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommitteesWidget extends StatelessWidget {
  CommitteesWidget(
      {super.key,
      required this.content,
      required this.function,
      required this.color});

  String content;
  Function function;
  bool color = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            function();
          },
          child: Container(
            decoration: BoxDecoration(
                color: color == false ? Colors.white : Colors.blue,
                border: Border.all(color: Colors.blue),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            width: 358.w,
            height: 75.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    content,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: color == true ? Colors.white : Colors.blue),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: color == true ? Colors.white : Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
