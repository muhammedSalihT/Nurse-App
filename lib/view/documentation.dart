import 'package:flutter/material.dart';
import 'package:project_una/view_model/services_view_model.dart';
import 'package:project_una/widgets/committees_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Documentation extends StatelessWidget {
  const Documentation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CommitteesWidget(
              content: "Dataflow experience corection",
              color: false,
              function: () {
                ServicesViewModel.showAlertDialog(context);
              },
            ),
            CommitteesWidget(
              content: "Exam date collection",
              color: false,
              function: () {
                ServicesViewModel.showAlertDialog(context);
              },
            ),
            CommitteesWidget(
              content: "Good standing certificate",
              color: false,
              function: () {
                ServicesViewModel.showAlertDialog(context);
              },
            ),
            CommitteesWidget(
              content: "Eligibility And Migration support",
              color: false,
              function: () {
                ServicesViewModel.showAlertDialog(context);
              },
            ),
            CommitteesWidget(
              content: "Embassy attestation",
              color: false,
              function: () {
                ServicesViewModel.showAlertDialog(context);
              },
            ), CommitteesWidget(
              content: "Transcript",
              color: false,
              function: () {
                ServicesViewModel.showAlertDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
