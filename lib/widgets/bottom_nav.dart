import 'package:flutter/material.dart';
import 'package:project_una/view/account_screen.dart';
import 'package:project_una/view/Notification/notification_details.dart';
import 'package:project_una/view/homepage.dart';
import 'package:project_una/widgets/bottom_nav_icons.dart';

class UserBottomNav extends StatelessWidget {
  UserBottomNav({
    super.key,
  });
  final pages = [const HomePage(), const MessageView(), const AccountScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const UserBottomIcons(),
        body: ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: (BuildContext ctx, int updatedindex, Widget? _) {
            return pages[updatedindex];
          },
        ));
  }
}
