import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/utils/scroll_physics.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/view_model/about_provider.dart';
import 'package:project_una/widgets/history_view.dart';
import 'package:project_una/widgets/navbar.dart';
import 'package:project_una/widgets/team_view.dart';
import 'package:project_una/widgets/whoweare_view.dart';
import 'package:project_una/widgets/custom_appbar_widget.dart';
import 'package:project_una/widgets/custom_tabbar.dart';
import 'package:provider/provider.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    final aboutProvider = Provider.of<AboutProvider>(context, listen: false);
    _tabController.index = aboutProvider.currentTab;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final aboutProvider = Provider.of<AboutProvider>(context);
    _tabController.addListener(() {
      aboutProvider.onTabChange(_tabController.index);
    });
    return Scaffold(
      drawer: const NavBar(),
      appBar: CustomAppbarWidget(
          leadingIcon: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: () {
                    return Scaffold.of(context).openDrawer();
                  },
                  icon: Image.asset("images/menu-left.jpg"));
            },
          ),
          centerTitle: Text(
            "About Us",
            style: TextStyle(
                color: ThemeConstents.appBodyBlack,
                fontWeight: FontWeight.w500,
                fontSize: 22.sp),
          )),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 8.w,
                right: 8.w,
              ),
              child: CustomTabBar(
                onTabTapping: (tabIndex) {
                  aboutProvider.onTabChange(tabIndex);
                },
                tabController: _tabController,
                labelColor: ThemeConstents.appBodyBlack,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                tabs: aboutProvider.tabList.map((e) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(1.w, 1.h, 0.w, 1.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      gradient: LinearGradient(
                          colors: aboutProvider.currentTab == e.selectedTab
                              ? ThemeConstents.appGradientColor
                              : [Colors.white, Colors.white]),
                    ),
                    child: Container(
                        height: 29.39.h,
                        width: 102.87.w,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              offset: Offset(0, 2),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(child: Text(e.tabText))),
                  );
                }).toList(),
              ),
            ),
            Expanded(
                child: TabBarView(
              physics: const CustomPageViewScrollPhysics(),
              controller: _tabController,
              children: const [
                HistoryView(),
                TeamView(),
                WhoWeAreView(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    log("call about dispose");
    super.dispose();
  }
}
