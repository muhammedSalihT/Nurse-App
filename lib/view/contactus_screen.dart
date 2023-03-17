import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:project_una/constants/theme/theme_constants.dart';

import 'package:project_una/widgets/button_widgget.dart';
import 'package:project_una/widgets/custom_appbar_widget.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
          leadingIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.black,
          ),
          centerTitle: Text(
            "Contact Us",
            style: TextStyle(color: ThemeConstents.appBodyBlack),
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Container(
                height: 97.h,
                width: 360.w,
                color: Colors.blue[50],
                child: Column(
                  children: [
                    SizedBox(
                      height: 19.h,
                    ),
                    Text(
                      "Social Media’s",
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Image(
                              image: const AssetImage("images/facebook.png"),
                              width: 18.33.w,
                              height: 20.83.h,
                            ),
                          ),
                          Image(
                            image: const AssetImage("images/instagram.png"),
                            width: 18.33.w,
                            height: 20.83.h,
                          ),
                          Image(
                            image: const AssetImage("images/youtube.png"),
                            width: 18.33.w,
                            height: 20.83.h,
                          ),
                          Image(
                            image: const AssetImage("images/twitter.png"),
                            width: 18.33.w,
                            height: 20.83.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
              Form(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Your Name",
                            hintStyle: TextStyle(fontSize: 14.sp),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 50.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Your Email",
                            hintStyle: TextStyle(fontSize: 14.sp),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        child: TextField(
                          maxLines: 6,
                          decoration: InputDecoration(
                            hintText: "Your Message",
                            hintStyle: TextStyle(fontSize: 14.sp),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Checkbox(
                    value: checked,
                    onChanged: (bool? value) {
                      setState(() {
                        checked = value!;
                      });
                    },
                  ),
                  Text(
                    "I agree that my submitted data is being collected and stored.",
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              ButtonWidget(
                buttonname: "Send Message",
                height: 34.h,
                width: 140.w,
                onclick: () {},
              ),
              SizedBox(
                height: 62.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.w),
                child: SizedBox(
                    height: 240.h,
                    child: InkWell(
                        onTap: () async {
                          return launchMap();
                        },

                        // log("hlooo");
                        // final url = Uri.parse(
                        //     "https://www.google.com/maps/place/IMIT+PARK+-+International+Media+and+Information+Technology+Park+%7C+IT+Company+In+Kerala/@10.3486756,76.2172834,15z/data=!4m6!3m5!1s0x3ba7f768249c9bf5:0x48c8065261fbf396!8m2!3d10.3486756!4d76.2172834!16s%2Fg%2F11p3h4q8h3");
                        // if (await canLaunchUrl(url)) {
                        //   await launchUrl(
                        //     url,
                        //   );
                        // } else {
                        //   throw 'Could not launch $url';
                        // }

                        child: Image.asset("images/maps.png"))),
              ),
              SizedBox(
                height: 49.h,
              ),
              Column(
                children: [
                  Text(
                    "United Nurses Association",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "Capital City,Door no,26/548/9, 2nd floor,",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "Chembukkav,Thrissur,Kerala 680020",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "unakeralaofficial@gmail.com",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    "+91 9072689400",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Our Newsletter",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    SizedBox(
                        width: 240.w,
                        height: 33.h,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Your Email",
                            hintStyle: TextStyle(fontSize: 12.sp),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(0)),
                          ),
                        )),
                    SizedBox(
                      width: 77,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)))),
                          onPressed: () {},
                          child: const Text("Send")),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> launchMap() async {
    final url =
        "https://www.google.com/maps/search/una+thrissur/@10.5263652,76.2013091,15z/data=!3m1!4b1";
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
