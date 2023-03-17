import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/theme/text_const.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({
    super.key,
  });

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

ScrollController? _controller;

class _HistoryViewState extends State<HistoryView> {
  @override
  void initState() {
    super.initState();
    // _controller = ScrollController();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _controller!
    //       .animateTo(
    //     _controller!.position.maxScrollExtent,
    //     duration: const Duration(seconds: 1),
    //     curve: Curves.ease,
    //   )
    //       .then((value) async {
    //     await Future.delayed(const Duration(seconds: 2));
    //     _controller!.animateTo(
    //       _controller!.position.minScrollExtent,
    //       duration: const Duration(seconds: 1),
    //       curve: Curves.ease,
    //     );
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "History",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Image.asset(
                  "images/image 3.png",
                  height: 286,
                  width: 194,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Text(
                  "Birth of United Nurses Association (UNA)",
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Text(
                  historyText,
                  style: TextStyle(
                      height: 1.5,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
