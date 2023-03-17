import 'dart:developer';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_una/helper/secure_storage.dart';
import 'package:project_una/view/CalenderPage.dart';
import 'package:project_una/view/unastore_screen.dart';
import 'package:project_una/view_model/homepage_view_model.dart';
import 'package:project_una/view_model/payment_screen_viewmodal.dart';
import 'package:project_una/widgets/appbar.dart';
import 'package:project_una/widgets/donate.dart';
import 'package:project_una/widgets/history_view.dart';
import 'package:project_una/widgets/navbar.dart';
import 'package:project_una/widgets/services.dart';
import 'package:project_una/widgets/social_media_pages.dart';
import 'package:project_una/widgets/sponserd_adds.dart';
import 'package:project_una/widgets/webpage_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

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
}

class _HomePageState extends State<HomePage> {
  late PaymentScreenViewModal paymentModal;
  //   String? amounts1;
  //   Razorpay _razorpay = Razorpay();
  //   List<String> amount = [
  //   "100",
  //   "200",
  //   "500",
  //   "1000",
  //   "2000",
  //   "5000",
  // ];

  // @override
  // void initState() {
  //   _razorpay = Razorpay();
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
  //   _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  //   _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  //   super.initState();
  // }

//   @override
//   void dispose() {
//     super.dispose();
//      _razorpay.clear();
//  }

  @override
  Widget build(BuildContext context) {
    paymentModal = Provider.of<PaymentScreenViewModal>(context);

    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBarWidget(text: "UNA ANGELS"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                child: CarouselSlider.builder(
                  itemCount: HomePageViewmodel.images.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = HomePageViewmodel.images[index];
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WeblinkWidget(
                                webLink:
                                    "https://www.facebook.com/jasminshauna",
                                showAppbar: true),
                          ));
                        } else if (index == 1) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WeblinkWidget(
                                webLink:
                                    "https://www.facebook.com/sudheepmv4u/friends",
                                showAppbar: true),
                          ));
                        } else if (index == 2) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WeblinkWidget(
                                webLink:
                                    "https://www.facebook.com/RNjithinlohi/",
                                showAppbar: true),
                          ));
                        }
                      },
                      child: HomePageViewmodel.buildImage(
                        urlImage,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: HomePageViewmodel.itemspaths.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          final images = HomePageViewmodel.itemspaths[index];
                          return GestureDetector(
                              onTap: () {
                                if (index == 0) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => WeblinkWidget(
                                      showAppbar: true,
                                      webLink:
                                          "https://v2.imitpark.com/una/gallery.html",
                                    ),
                                  ));
                                } else if (index == 1) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const CalenderPage(),
                                  ));
                                } else if (index == 2) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const HistoryView(),
                                  ));
                                } else if (index == 3) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => WeblinkWidget(
                                      showAppbar: true,
                                      webLink: "https://v2.imitpark.com/una/",
                                    ),
                                  ));
                                } else if (index == 4) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const UnastoreScreen()));
                                }
                              },
                              child: images);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Image.asset(
                      "images/image 1.png",
                      height: 150,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "International Nurses \nConference – Delegates \nfrom 36+ Countries",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Canada United Nurses Association official \ninauguration | Honor Canada Covid Warriors \n| 12- May -2023",
                          style: TextStyle(fontSize: 8),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () async {
                            WeblinkWidget(
                                webLink: 'https://www.unaworld.org/',
                                showAppbar: true);
                          },
                          child: const Text(
                            "Join Now",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SocialMedia(),

              //  Card(
              //               elevation: 5,
              //               child: Container(
              //                 padding: const EdgeInsets.all(20),
              //                 decoration: BoxDecoration(
              //                     border: Border(
              //                         left: BorderSide(color: Colors.blue.shade200),
              //                         top: BorderSide(color: Colors.blue.shade200),
              //                         right: BorderSide(color: Colors.blue.shade200))),
              //                 width: 358.w,
              //                 height: 194.h,
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "Donate",
              //                       style: TextStyle(
              //                           fontSize: 18.sp, fontWeight: FontWeight.w700),
              //                     ),
              //                     // SizedBox(height: 10.h,),
              //                     Container(
              //                       width: MediaQuery.of(context).size.width,
              //                       height: 150,
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(12.0),
              //                         child: GridView.builder(
              //                           gridDelegate:
              //                               SliverGridDelegateWithFixedCrossAxisCount(
              //                                   crossAxisCount: 3,
              //                                   mainAxisSpacing: 7,
              //                                   crossAxisSpacing: 7,
              //                                   childAspectRatio: 1.5),
              //                           itemBuilder: (context, index) {
              //                             return InkWell(
              //                               onTap: () {
              //                                 setState(() {
              //                                   amounts1 = amount[index];
              //                                 });
              //                                 openCheckOut(amount[index]);

              //                               },
              //                               child: Container(
              //                                 decoration: BoxDecoration(
              //                                     border: Border.all(
              //                                       color: ThemeConstents.appPrimeryColor,
              //                                     ),
              //                                     // color:
              //                                     borderRadius: BorderRadius.circular(5)),
              //                                 width: 111,
              //                                 height: 37,
              //                                 child: Center(
              //                                     child: Text(
              //                                   "₹${amount[index]}",
              //                                   style: TextStyle(
              //                                     color: ThemeConstents.appPrimeryColor,
              //                                   ),
              //                                 )),
              //                               ),
              //                             );
              //                           },
              //                           itemCount: 6,
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //             const SizedBox(
              //               height: 20,
              //             ),
              HomePageServices(
                showText: false,
                title:
                    "‘The Measure of life is not its \nduration, but its donation.’",
                link: "images/Group 61.jpg",
                buttonTitle: "Donate ",
                function: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DonatePage(),
                  ));
                },
              ),
              HomePageServices(
                showText: true,
                title: "‘Save one life, you're a \nhero....’",
                link:
                    "images/healthcare-workers-prevent-virus-insurance-medicine-concept-smiling-attractive-female-doctor-nurse-blue-scrubs-pointing-fingers-left-show-patients-advertisement-important-info 1.jpg",
                buttonTitle: "Loan Application",
                secondText: "Nursing Students Admission ",
                function: () async {
                  await SecureStore.getUserType() == null
                      ? HomePageViewmodel.showAlertDialog(
                          context, "Nursing Students Admission ")
                      : HomePage.whatsapp();
                },
              ),
              HomePageServices(
                showText: false,
                title: "Nursing Students Loan",
                link: "images/DESIGNED_BY_FREEPIK.jpg",
                buttonTitle: "Loan Application",
                function: () async {
                  await SecureStore.getUserType() == null
                      ? HomePageViewmodel.showAlertDialog(
                          context, "Nursing Students Loan")
                      : HomePage.whatsapp();
                },
              ),
              HomePageServices(
                showText: false,
                title: "UNA \nEmployment \nExchange",
                link: "images/OBJECTS.jpg",
                buttonTitle: "Application Form",
                function: () async {
                  await SecureStore.getUserType() == null
                      ? HomePageViewmodel.showAlertDialog(
                          context, "UNA Employment Exchange")
                      : HomePage.whatsapp();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("Sponsered Ads"),
              SponSerdAdds(
                iamgepath: "images/ardram.png",
                weblink: "https://ardram.org/",
                showappbar: true,
              ),
              SponSerdAdds(
                  iamgepath: "images/IMIT_web_page.png",
                  weblink: "https://imitpark.com/",
                  showappbar: true),
            ],
          ),
        ),
      ),
    );
  }

  //  void openCheckOut(String selectedAmount) async {
  //   if (selectedAmount.isEmpty) {
  //     return;
  //   }

  //   var options = {
  //     'key': 'rzp_live_odrmJ2TVl6Ux2P',
  //     'amount': (double.parse(selectedAmount) * 100.roundToDouble()).toString(),
  //     'name': 'UNA',
  //     'description': '',
  //     'prefill': {'contact': '', 'email': ''},
  //     'external': {
  //       'wallets': ['paytm']
  //     }
  //   };
  //   try {
  //     _razorpay.open(options);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  // PaymentSuccessResponse? response;
  // String successresponsepid = "";
  // String failureresponsepid = "";

  // void _handlePaymentSuccess(PaymentSuccessResponse response) async {
  //   log(response.paymentId.toString());

  //   setState(() {
  //     successresponsepid = response.paymentId.toString();
  //   });

  //   paymentModal.paymentResponse.paymentId = response.paymentId;
  //   paymentModal.paymentResponse.status = "Success";
  //   paymentModal.paymentResponse.amount = amounts1;
  //       paymentModal.paymentResponse.phone =SecureStore.storedemail;

  //   await paymentModal.donate(context);
  //   log('Api hit');

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       padding: EdgeInsets.all(20),
  //       backgroundColor: Colors.green,
  //       duration: Duration(seconds: 5),
  //       behavior: SnackBarBehavior.floating,
  //       content: Text("Payment Success${response.paymentId}"),
  //     ),
  //   );
  // }

  // void _handlePaymentError(PaymentFailureResponse response) async {
  //   log(response.message.toString());
  //   log(response.code.toString());
  //   log(response.error.toString());

  //   setState(() {
  //     failureresponsepid = response.code.toString();
  //   });
  //   paymentModal.paymentResponse.paymentId = response.error!["reason"];
  //   paymentModal.paymentResponse.status = "Failure";
  //   paymentModal.paymentResponse.amount = amounts1;
  //   paymentModal.paymentResponse.phone =SecureStore.storedemail;

  //   await paymentModal.donate(context);
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       padding: EdgeInsets.all(20),
  //       backgroundColor: Colors.red,
  //       duration: Duration(seconds: 5),
  //       behavior: SnackBarBehavior.floating,
  //       content: Text("Payment Failed  ${response.message}"),
  //     ),
  //   );
  // }

  // void _handleExternalWallet(ExternalWalletResponse response) {
  // }
}
