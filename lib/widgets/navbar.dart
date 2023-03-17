import 'package:flutter/material.dart';
import 'package:project_una/helper/secure_storage.dart';
import 'package:project_una/view/about_screeen.dart';
import 'package:project_una/view/committees.dart';
import 'package:project_una/view/disclaimer.dart';
import 'package:project_una/view/privacy_policy.dart';
import 'package:project_una/view/contactus_screen.dart';
import 'package:project_una/view/service_screen.dart';
import 'package:project_una/view/termsandconditions_screen.dart';
import 'package:project_una/view/transaction_screen.dart';
import 'package:project_una/widgets/bottom_nav.dart';
import 'package:project_una/widgets/webpage_widget.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        backgroundColor: Colors.black.withOpacity(0.7),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Textwidget(
                          title: "Home",
                          function: () {
                            Navigator.pop(context);

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => UserBottomNav(),
                                ),
                                (route) => false);
                          }),
                      Textwidget(
                          title: "Services",
                          function: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ServiceScreen(),
                            ));
                          }),
                      Textwidget(
                          title: "About Us",
                          function: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AboutScreen(),
                            ));
                          }),
                      Textwidget(
                          title: "News",
                          function: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => WeblinkWidget(
                                  webLink:
                                      "https://www.unaworld.org/classic-2/",
                                  showAppbar: true),
                            ));
                          }),
                      Textwidget(
                          title: "Committees",
                          function: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Committees(),
                            ));
                          }),
                      Textwidget(
                          title: "Contact Us",
                          function: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ContactUsPage(),
                            ));
                          }),
                      Textwidget(title: "Rating", function: () {}),
                      Textwidget(
                          title: "Privacy Policy",
                          function: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const PrivacyPolicy(),
                            ));
                          }),
                      Textwidget(
                          title: "Disclaimer",
                          function: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Disclaimer(),
                            ));
                          }),
                      Textwidget(
                          title: "Share App",
                          function: () {
                            Navigator.pop(context);
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => const RegistartionScreen(),
                            // ));
                          }),
                      Textwidget(
                          title: "Payment History",
                          function: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const TransactionScreen(),
                            ));
                          }),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  showAlertDialog(context);
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.logout,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Log Out",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                )),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const TermsAndConditionsPage(),
                                  ));
                                },
                                child: const Text(
                                  "Terms And Condition",
                                  style: TextStyle(color: Colors.white),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    final alert = AlertDialog(
      title: const Text(
        "Are you sure you want logout?",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: Colors.black.withOpacity(0.4),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            SecureStore.logOutUser(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: const Text(
            "No",
            style: TextStyle(color: Colors.blue),
          ),
        )
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
}

class Textwidget extends StatelessWidget {
  Textwidget({super.key, required this.title, required this.function});

  String title;
  Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: -40,
      title: Center(
        child: Opacity(
          opacity: 0.7,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      onTap: () {
        function();
      },
    );
  }
}
