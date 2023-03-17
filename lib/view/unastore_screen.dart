import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/widgets/appbar.dart';
import 'package:project_una/widgets/custom_appbar_widget.dart';
import 'package:project_una/widgets/navbar.dart';

class UnastoreScreen extends StatelessWidget {
  const UnastoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarWidget(text: "UNA Store"),
      drawer: NavBar(),
      //  CustomAppbarWidget(
      //     leadingIcon: SvgPicture.asset(
      //       "images/Group.svg",
      //       height: 20,
      //       width: 20,
      //     ),
      //     centerTitle: Text(
      //       "UNA Store",
      //       style: TextStyle(color: ThemeConstents.appBodyBlack),
      //     ),),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/comingsoonimage.png"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
