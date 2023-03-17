import 'package:flutter/material.dart';
import 'package:project_una/constants/theme/theme_constants.dart';

ValueNotifier<int> selectedIndex = ValueNotifier(0);

class UserBottomIcons extends StatelessWidget {
  const UserBottomIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (BuildContext ctx, int update, Widget? _) {
          return BottomNavigationBar(
              selectedItemColor: ThemeConstents.appPrimeryColor,
              unselectedItemColor: Colors.black,
              currentIndex: update,
              onTap: (value) {
                selectedIndex.value = value;
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: "Notifications"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: "Account"),
              ]);
        });
  }
}
