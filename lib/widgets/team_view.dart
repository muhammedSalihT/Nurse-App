import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/model/team_model.dart';
import 'package:project_una/view_model/about_provider.dart';
import 'package:provider/provider.dart';

class TeamView extends StatelessWidget {
  const TeamView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final aboutProvider = Provider.of<AboutProvider>(context);
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 25.h),
      physics: const BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        RichText(
          text: TextSpan(
              text: "Our",
              style: TextStyle(
                  fontSize: 18.sp, color: ThemeConstents.appBodyBlack),
              children: [
                TextSpan(
                    text: " Leadership",
                    style: TextStyle(
                        fontSize: 18.sp, color: ThemeConstents.appPrimeryColor))
              ]),
        ),
        RichText(
          text: TextSpan(
            text: "team together",
            style:
                TextStyle(fontSize: 18.sp, color: ThemeConstents.appBodyBlack),
            children: [
              TextSpan(
                  text: " we are strong",
                  style: TextStyle(
                      fontSize: 18.sp, color: ThemeConstents.appPrimeryColor))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 14.w,
                childAspectRatio: .683),
            itemCount: aboutProvider.teamList.length,
            itemBuilder: (context, index) {
              TeamModel teamMember = aboutProvider.teamList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(teamMember.memeberImage),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      teamMember.memeberName,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    teamMember.memeberRole,
                    style: TextStyle(
                        color: ThemeConstents.appPrimeryColor, fontSize: 12.sp),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                              height: 20.w,
                              width: 20.w,
                              "assets/images/facebook.svg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: SvgPicture.asset(
                              height: 18.w,
                              width: 18.w,
                              "assets/images/instagram.svg"),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}
