import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key? key,
    required this.tabs,
    this.tabController,
    this.indicatorColor,
    this.onTabTapping,
    this.labelColor,
    this.labelStyle,
  }) : super(key: key);

  final List<Widget> tabs;
  final TabController? tabController;
  final Color? indicatorColor;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final void Function(int)? onTabTapping;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, bottom: 25.h),
      child: TabBar(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          labelStyle: labelStyle ?? const TextStyle(),
          labelColor: labelColor ?? Colors.white,
          onTap: onTabTapping,
          labelPadding: const EdgeInsets.all(2),
          controller: tabController,
          indicator: BoxDecoration(color: indicatorColor ?? Colors.transparent),
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: tabs),
    );
  }
}
