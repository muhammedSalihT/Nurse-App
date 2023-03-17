import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesViewModel {
  static showAlertDialog(BuildContext context) {
    final alert = AlertDialog(
      titlePadding: const EdgeInsets.all(20),
      title: const Text(
        "for more details contact us",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: Colors.black.withOpacity(0.7),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            // _launchWhatsapp(context);
            // launchWhatsAppp();
            whatsapp();
          },
          child: Text(
            "contact WhatsApp",
            style: TextStyle(color: Colors.blue),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static launch(BuildContext context, String url) async {
    // var whatsapp = "9567622389";
    var whatsappAndroid = Uri.parse(url);
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }


   static whatsapp() async {
    var contact = "+918593833370";
    var androidUrl = "whatsapp://send?phone=$contact";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      log("logg");
    }
  }

  static launchWhatsAppp() async {
    final phoneNumber =
        '9074691702'; // Replace with the phone number you want to send a message to
    final whatsappUrl = "https://wa.me/$phoneNumber";

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
}
