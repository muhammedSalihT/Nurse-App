import 'package:flutter/material.dart';
import 'package:project_una/model/tabbar_model.dart';

class ServiceProvider extends ChangeNotifier {
  int currentTab = 0;
  String selectHeading() {
    switch (currentTab) {
      case 0:
        return "Training";
      default:
        return "Documentation";
    }
  }

  List<TabBarModel> tabList = [
    TabBarModel(tabText: "Training", selectedTab: 0),
    TabBarModel(tabText: "Documentation", selectedTab: 1),
  ];

  onTabChange(tabIndex) {
    currentTab = tabIndex;
    notifyListeners();
  }
}
