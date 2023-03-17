import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class InputFormPhFieldWidget extends StatelessWidget {
  const InputFormPhFieldWidget(
      {this.labelText,
      super.key,
      this.controller,
      this.fieldPadding,
      this.enabled,
      this.invalidNumberMessage});

  final String? labelText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? fieldPadding;
  final bool? enabled;
  final String? invalidNumberMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: fieldPadding ??
          EdgeInsets.only(left: 30.w, right: 30.w, bottom: 12.h),
      child: IntlPhoneField(
        enabled: enabled ?? false,
        invalidNumberMessage: invalidNumberMessage ?? "Enter Whatsup Number",
        showCountryFlag: false,
        decoration: InputDecoration(
          label: Padding(
            padding:  EdgeInsets.only(right: 30.h),   
            child: Text(labelText.toString()),
          ),
          border: const OutlineInputBorder(borderSide: BorderSide()),
        ),
        initialCountryCode: 'IN',
        controller: controller,
        flagsButtonMargin: EdgeInsets.only(left: 5.w),
      ),
    );
  }
}
