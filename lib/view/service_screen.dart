import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/utils/scroll_physics.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/view/documentation.dart';
import 'package:project_una/view/training.dart';
import 'package:project_una/view_model/service_provider.dart';
import 'package:project_una/widgets/custom_appbar_widget.dart';
import 'package:project_una/widgets/custom_tabbar.dart';
import 'package:project_una/widgets/navbar.dart';
import 'package:provider/provider.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    final serviceProvider =
        Provider.of<ServiceProvider>(context, listen: false);
    _tabController.index = serviceProvider.currentTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        serviceProvider.onTabChange(_tabController.index);
      }
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
            serviceProvider.selectHeading(),
            style: TextStyle(
                color: ThemeConstents.appBodyBlack,
                fontWeight: FontWeight.w500,
                fontSize: 22.sp),
          )),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: .15.sw),
            child: CustomTabBar(
              tabController: _tabController,
              labelColor: ThemeConstents.appBodyBlack,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
              tabs: serviceProvider.tabList.map((e) {
                return Container(
                  padding: EdgeInsets.fromLTRB(1.w, 1.h, 0.w, 1.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    gradient: LinearGradient(
                        colors: _tabController.index == e.selectedTab
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
              controller: _tabController,
              physics: const CustomPageViewScrollPhysics(),
              children: const [
                Center(child: Traninig()),
                Center(child: Documentation()),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
