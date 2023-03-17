import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/view/registartion.dart';

class HomePageViewmodel extends ChangeNotifier {
  static final List<Image> itemspaths = [
    Image.asset("images/Gallery.jpg"),
    Image.asset("images/Calender.png"),
    Image.asset("images/History.png"),
    Image.asset("images/Seminar.png"),
    Image.asset("images/Store.png")
  ];

  static showAlertDialog(BuildContext context, String content) {
    final alert = AlertDialog(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: ThemeConstents.appPrimeryColor),
          borderRadius: BorderRadius.circular(15.r)),
      titlePadding: const EdgeInsets.all(20),
      title: Text(
        "Please Complete Registration For $content",
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: Colors.white.withOpacity(0.1),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text(
            "Back",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegistartionScreen(),
                ),
                (route) => false);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text(
            "Register",
            style: TextStyle(color: Colors.blue),
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
//? this function using for slide bar widget in homepage

  static Widget buildImage(
    String urlImage,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        width: double.infinity,
        height: 250,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

//! THIS LIST SHOWS IMAGES OF SLIDE BAR WIDGET IN HOMEPAGE

  static List<String> images = [
    "images/Jasminsha-01.jpg",
    "images/sudeepmv.jpg",
    "images/jithinlohi.jpg",
  ];

// THIS METHOD USING FOR
}
