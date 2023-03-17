import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/widgets/webpage_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(color: Colors.blue.shade200),
                top: BorderSide(color: Colors.blue.shade200),
                right: BorderSide(color: Colors.blue.shade200))),
        width: 358.w,
        height: 194.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "United Nurses Association \n(UNA)",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(

                      height: 10.h,
                    ),
                    GestureDetector(
                        onTap: () async {
                          final url = Uri.parse('https://www.unaworld.org/');
                          if (await launchUrl(url)) {
                          } else {
                            throw const CircularProgressIndicator();
                          }
                        },
                        child: const Text(
                          "Website Lik",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
                SizedBox(

                  width: 120.w,
                  child: Image.asset(
                    "images/UNA World – United Nurses Association – Kerala – Nursing Association in Kerala, India - Google Chrome 12-02-2023 18_02_58 1.jpg",
                  ),
                )
              ],
            ),
            SizedBox(

              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WeblinkWidget(
                            showAppbar: false,
                            webLink:
                                'https://www.facebook.com/officialpageuna/'),
                      ));
                    },
                    icon: Transform.scale(
                        scale: 2,
                        child: Image.asset("images/Group 11761.jpg"))),
                VerticalDivider(
                  width: 2.w,
                  color: Colors.grey,
                ),
                IconButton(
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WeblinkWidget(
                            webLink:
                                "https://www.instagram.com/united_nurses_association/",
                            showAppbar: false),
                      ));
                    },
                    icon: Transform.scale(
                        scale: 2, child: Image.asset("images/Group 1174.png"))),
                VerticalDivider(
                  thickness: 3,
                  width: 2.w,
                  color: Colors.grey[900],
                ),
                IconButton(
                    onPressed: () async {
                      final url = Uri.parse('https://twitter.com/UNA_Kerala');
                      if (await launchUrl(url)) {
                      } else {
                        throw const CircularProgressIndicator();
                      }
                    },
                    icon: Transform.scale(
                        scale: 2, child: Image.asset("images/Group 1173.png"))),
                VerticalDivider(
                  width: 2.w,
                  color: Colors.grey,
                ),
                IconButton(
                    onPressed: () async {
                      final url = Uri.parse(
                          'https://www.youtube.com/@unitednursesassociation1872');
                      if (await launchUrl(url)) {
                      } else {
                        throw const CircularProgressIndicator();
                      }
                    },
                    icon: Transform.scale(
                        scale: 2, child: Image.asset("images/Youtube1.jpg"))),
              ],
            )
          ],
        ),
      ),
    );
  }
}