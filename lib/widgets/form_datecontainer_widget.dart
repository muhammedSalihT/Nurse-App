import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormDateContainer extends StatefulWidget {
  FormDateContainer({
    super.key,
    required this.datepick,
    required this.datenow,
    required this.clicked,
    required this.validate,
  });

  VoidCallback datepick;
  DateTime datenow;
  bool clicked;
  bool validate;

  @override
  State<FormDateContainer> createState() => _FormDateContainerState();
}

class _FormDateContainerState extends State<FormDateContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 12.h),
      child: GestureDetector(
        onTap: () {
          widget.datepick();
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 50.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                  color: widget.validate ? Colors.red : Colors.black45)),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.clicked
                  ? Text(
                      '${widget.datenow.day}/${widget.datenow.month}/${widget.datenow.year}')
                  : Text(
                      'Date of Birth',
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
