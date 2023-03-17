import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/theme/text_const.dart';

class WhoWeAreView extends StatelessWidget {
  const WhoWeAreView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 25.w,
            ),
            child: Text(
              "Who we are",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h, left: 25.w, right: 25.w),
            child: Text(
              whoWeAreText,
              style: TextStyle(
                  height: 1.5, fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: CustomWhoWeAreContainer(
              contentHeadding: "Caring",
              content:
                  "We’re here to improve patient care through supporting both individuals and organizations to advance the nursing profession",
              contentImage: "assets/images/Group 36.svg",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SizedBox(
              height: 155.h,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ColoredBox(
                      color: Colors.blue.withOpacity(.05),
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.w, left: 30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Project",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: Text(
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey.shade700),
                                  "To protect nurses rights from various exploitation’s in current healthcare system and legal compliances"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Row(
                                children: [
                                  Text(
                                    'Learn More',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff00a0de),
                                    ),
                                  ),
                                  SvgPicture.asset(
                                      height: 16.h,
                                      width: 16.h,
                                      fit: BoxFit.cover,
                                      "assets/images/arrow-right-up.svg")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 30.w),
                    child: Image.asset(
                      "assets/images/second.png",
                      height: 100.h,
                      width: 90.w,
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: CustomWhoWeAreContainer(
              contentHeadding: "Support",
              content:
                  "Support people in society who less privileged, Students, Patients, Poor People who need help for care and love.",
              contentImage: "assets/images/object.svg",
              imageHeight: 80.h,
              imageWidth: 70.w,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomWhoWeAreContainer extends StatelessWidget {
  const CustomWhoWeAreContainer({
    super.key,
    required this.contentHeadding,
    required this.content,
    required this.contentImage,
    this.imageHeight,
    this.imageWidth,
  });
  final String contentHeadding;
  final String content;
  final String contentImage;
  final double? imageHeight;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155.h,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15.w, left: 30.w),
            child: SvgPicture.asset(
              contentImage,
              height: imageHeight ?? 90.h,
              width: imageWidth ?? 80.w,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 1,
            child: ColoredBox(
              color: Colors.blue.withOpacity(.05),
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, right: 30.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contentHeadding,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        content,
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey.shade700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Row(
                        children: [
                          Text(
                            'Learn More',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff00a0de),
                            ),
                          ),
                          SvgPicture.asset(
                              height: 16.h,
                              width: 16.h,
                              fit: BoxFit.cover,
                              "assets/images/arrow-right-up.svg")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
