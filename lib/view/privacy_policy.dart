// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:project_una/widgets/appbar.dart';
// import 'package:project_una/widgets/bottom_nav_icons.dart';
// import 'package:project_una/widgets/navbar.dart';

// class PrivacyPolicyPage extends StatelessWidget {
//   const PrivacyPolicyPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: const UserBottomIcons(),
//       drawer: const NavBar(),
//       appBar: AppBarWidget(text: "Privacy Policy"),
//       body: Column(
//         children: [
//           Center(
//             child: SizedBox(
//               height: 447.h,
//               width: 315.w,
//               child: Text(
//                 "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of 'de Finibus Bonorum et Malorum' (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, 'Lorem ipsum dolor sit amet..', comes from a line in section 1.10.32.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     height: 1.2.h,
//                     fontSize: 15.sp,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: const NavBar(),
      appBar: AppBar(
        actions: [
          // IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.notifications,
          //       color: Colors.black,
          //     ))
        ],
        title: Center(
          child: Text(
            "Privacy Policy",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        // leading: Builder(
        //   builder: (context) => IconButton(
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       icon: Image.asset("images/navlogo.png")),
        // ),
      ),
      body: ListView(
        // height: double.infinity,
        // width: double.infinity,
        // decoration: const BoxDecoration(color: Colors.white),
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 15,
                top: 20,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your privacy is important to UNA (hereinafter referred to as the “website”). This privacy statement provides information about the personal information that the website collects, and the ways in which the website uses that personal information.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "Personal information collection :",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.blueAccent),
                  ),
                  SizedBox(

                    height: 7,
                  ),
                  Text(
                    "The website may collect and use the following kinds of personal information:",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      color: Colors.white,
                      height: 240,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "•",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(

                                    width: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "information about your use of this website (including browsing patterns and behaviour);",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                                ]),
                          ),
                          SizedBox(

                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "•",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(

                                    width: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "information that you provide using for the purpose of registering with the website (including contact details);",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                                ]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "•",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(

                                    width: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "information about transactions carried out over this website;",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                                ]),
                          ),
                          SizedBox(

                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "•",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(

                                    width: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "information that you provide for the purpose of subscribing to the website services ( email alerts); and any other information that you send to fellow users and webmaster.",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                    ),
                                  ))
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "Using personal information:",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.blueAccent),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "The website may collect and use the following kinds of personal information:",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      color: Colors.white,
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "•",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(

                                    width: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "administer this website;",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                                ]),
                          ),
                          SizedBox(

                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "•",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(

                                    width: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "personalise the website for you;",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                                ]),
                          ),
                          SizedBox(

                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "•",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(

                                    width: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "enable your access to and use of the website services;",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                                ]),
                          ),
                          SizedBox(

                            height: 5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "•",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(

                                    width: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "publish information about you on the website;",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                                ]),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "•",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(

                                    width: 4,
                                  ),
                                  Expanded(
                                      child: Text(
                                    "send you marketing communications.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "Where the website discloses your personal information to its agents or sub-contractors for these purposes, the agent or sub-contractor in question will be obligated to use that personal information in accordance with the terms of this privacy statement.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "In addition to the disclosures reasonably necessary for the purposes identified elsewhere above, the website may disclose your personal information to the extent that it is required to do so by law, in connection with any legal proceedings or prospective legal proceedings, and in order to establish, exercise or defend its legal rights.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "Securing of your data:",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.blueAccent),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "The website will take reasonable technical and organisational precautions to prevent the loss, misuse or alteration of your personal information.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 7,
                  ),
                  Text(
                    "The website will store all the personal information you provide on its secure servers.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "Updating this statement:",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.blueAccent),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    " The website may update this privacy policy by posting a new version on this website.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 7,
                  ),
                  Text(
                    " You should check this page occasionally to ensure you are familiar with any changes.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "Other websites:",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.blueAccent),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "This website contains links to other websites.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 7,
                  ),
                  Text(
                    "The website is not responsible for the privacy policies or practices of any third party.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "Contact Webmaster:",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.blueAccent),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "If you have any questions about this privacy policy or the website’s treatment of your personal information, please write to:",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Webmaster:",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  // Text(
                  //   "K.karunakaran sapathathi madhiram, m.g road thrissur , kerala , 680001",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 13,
                  //   ),
                  // ),
                  Text(
                    "Developer : imitpark ltd. , tana, irinjalakuda, thrissur , pin :680121 , mob:+918593833370 ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
