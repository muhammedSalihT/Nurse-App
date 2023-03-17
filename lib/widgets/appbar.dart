import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget(
      {super.key, required this.text, this.leadingIcon, this.myActionWidget});
  String? text;
  Widget? leadingIcon;
  Widget? myActionWidget;
  void Function()? onTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 70.h,
      leading: leadingIcon ??
          Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    return Scaffold.of(context).openDrawer();
                  },
                  icon: Image.asset("images/menu-left.jpg"));
            },
          ),
      title: Text(
        text.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 22, color: Colors.black),
      ),
      actions: [myActionWidget ?? const SizedBox()],
    );
  }
}
