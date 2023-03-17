import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarWidget(
      {super.key, required this.leadingIcon, required this.centerTitle});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  final Widget leadingIcon;
  final Widget centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: leadingIcon,
      ),
      title: centerTitle,
    );
  }
}
