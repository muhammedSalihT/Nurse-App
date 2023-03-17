// import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:project_una/widgets/appbar.dart';
// import 'package:project_una/widgets/bottom_nav_icons.dart';
// import 'package:project_una/widgets/navbar.dart';

// class DisclaimerPage extends StatelessWidget {
//   const DisclaimerPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: const UserBottomIcons(),
//       drawer: const NavBar(),
//       appBar: AppBarWidget(text: "Disclaimer"),
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
import 'package:project_una/widgets/appbar.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppBarWidget(text: "Disclaimer",),
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
            "Disclaimer",
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
        //       icon: Image.asset("")),
        // ),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 15,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "No warranties:",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color.fromARGB(255, 211, 145, 46)),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "Una  (hereinafter referred to as the “website”) is provided “as is” without any representations or warranties, express or implied. This website makes no representations or warranties in relation to this website or the information and materials provided on this website.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "Without prejudice to the generality of the foregoing paragraph, the website does not warrant that:",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      color: Colors.white,
                      height: 90,
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
                                    "this website will be constantly available, or available at all; or",
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
                                    "the information on this website is complete, true, accurate or non-misleading.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                  ))
                                ]),
                          ),
                          SizedBox(

                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "Nothing on this website constitutes, or is meant to constitute, advice of any kind.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(

                    height: 10,
                  ),
                  Text(
                    "Limitations of liability",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color.fromARGB(255, 211, 145, 46)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
