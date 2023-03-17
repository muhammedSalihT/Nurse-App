import 'package:flutter/material.dart';
import 'package:project_una/widgets/appbar.dart';
import 'package:project_una/widgets/committees_widgets.dart';
import 'package:project_una/widgets/bottom_nav_icons.dart';
import 'package:project_una/widgets/navbar.dart';

class Committees extends StatelessWidget {
  const Committees({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const UserBottomIcons(),
      drawer: const NavBar(),
      appBar: AppBarWidget(text: "Committees"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CommitteesWidget(
              color: false,
              content: "Aswini Hospital Limited",
              function: () {},
            ),
            CommitteesWidget(
              color: false,
              content: "West Fort Hi-Tech Hospital",
              function: () {},
            ),
            CommitteesWidget(
              color: false,
              content: "Saroja Multi-Speciality Hospital",
              function: () {},
            ),
            CommitteesWidget(
              color: false,
              content: "Elite Mission Hospital",
              function: () {},
            ),
            CommitteesWidget(
              color: false,
              content:
                  "Jubilee Mission Medical College \nHospital, Eastfort Thrissur",
              function: () {},
            )
          ],
        ),
      ),
    );
  }
}
