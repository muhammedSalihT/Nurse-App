import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_una/view_model/services_view_model.dart';
import 'package:project_una/widgets/committees_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Traninig extends StatelessWidget {
  const Traninig({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CommitteesWidget(
            content: "KNC Registraction ACLS/BLS",
            color: false,
            function: () {
              ServicesViewModel.showAlertDialog(context);
            },
          ),
          CommitteesWidget(
            content: "UNA accademy \nonline",
            color: false,
            function: () {
              ServicesViewModel.showAlertDialog(context);
            },
          ),
          CommitteesWidget(
            content: "IELTS",
            color: false,
            function: () {
              ServicesViewModel.showAlertDialog(context);
            },
          ),
          CommitteesWidget(
            content: "OET",
            color: false,
            function: () {
              ServicesViewModel.showAlertDialog(context);
            },
          ),
          CommitteesWidget(
            content: "Exam Prepration",
            color: false,
            function: () {
              ServicesViewModel.showAlertDialog(context);
            },
          )
        ],
      ),
    );
  }
  
   
}
