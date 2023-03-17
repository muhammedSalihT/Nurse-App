import 'package:flutter/material.dart';
import 'package:project_una/model/tabbar_model.dart';
import 'package:project_una/model/team_model.dart';

class AboutProvider extends ChangeNotifier {
  int currentTab = 0;

  List<TabBarModel> tabList = [
    TabBarModel(tabText: "History", selectedTab: 0),
    TabBarModel(tabText: "Our Team", selectedTab: 1),
    TabBarModel(tabText: "Who we are", selectedTab: 2)
  ];

  List<TeamModel> teamList = [
    TeamModel(
        memeberImage:
            "images/image_2023_02_24T10_57_25_563Z.png",
        memeberName: "Jasmin Sha",
        memeberRole: "National President",
        memberFaceLink: "",
        memberInstaLink: ""),
    TeamModel(
        memeberImage: "images/image_2023_02_24T10_57_25_572Z.png",
        memeberName: "Sudeep MV",
        memeberRole: "National Secretary",
        memberFaceLink: "",
        memberInstaLink: ""),
    TeamModel(
        memeberImage: "images/image_2023_02_24T10_57_25_571Z.png",
        memeberName: "Shoby Joseph",
        memeberRole: "President-Kerala",
        memberFaceLink: "",
        memberInstaLink: ""),
    TeamModel(
        memeberImage: "images/image_2023_02_24T10_57_25_570Z.png",
        memeberName: "Rasmi",
        memeberRole: "Secretary-Kerala",
        memberFaceLink: "",
        memberInstaLink: ""),
    TeamModel(
        memeberImage: "images/image_2023_02_24T10_57_25_567Z.png",
        memeberName: "Divya ES",
        memeberRole: "Treasurer-Kerala",
        memberFaceLink: "",
        memberInstaLink: ""),
    TeamModel(
        memeberImage:
            "images/image_2023_02_24T10_57_25_566Z.png",
        memeberName: "Jithin Lohi",
        memeberRole: "International Coordinator",
        memberFaceLink: "",
        memberInstaLink: ""),
    TeamModel(
        memeberImage: "images/image_2023_02_24T10_57_25_573Z.png",
        memeberName: "Nowfal NM",
        memeberRole: "International Coordinator",
        memberFaceLink: "",
        memberInstaLink: ""),
  ];

  onTabChange(tabIndex) {
    currentTab = tabIndex;
    notifyListeners();
  }
}
