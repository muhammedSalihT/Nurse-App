import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFormAddressWidget extends StatelessWidget {
  InputFormAddressWidget({super.key, this.hinttext, required this.controller});

  String? hinttext;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 12.h),
      child: TextFormField(
        // controller: _addressController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 40, 0, 40),
          hintText: hinttext,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
