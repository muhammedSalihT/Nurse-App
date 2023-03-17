// import 'dart:developer';

// import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:project_una/constants/theme/theme_constants.dart';
// import 'package:project_una/view/payment_screen_viewmodal.dart';
// import 'package:project_una/widgets/AppBar/appbar.dart';
// import 'package:project_una/widgets/ButtonWidget1.dart';
// import 'package:project_una/widgets/Navbar/navbar.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class DonatePage extends StatefulWidget {
//   const DonatePage({super.key});

//   @override
//   State<DonatePage> createState() => _DonatePageState();
// }

// class _DonatePageState extends State<DonatePage> {
//   late PaymentScreenViewModal paymentModal;
//   final fomKey = GlobalKey<FormState>();
//   Razorpay _razorpay = Razorpay();
//   TextEditingController amountControler = TextEditingController();

//   @override
//   void initState() {
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const NavBar(),
//       appBar: AppBarWidget(text: "Donate"),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Center(
//               child: SizedBox(
//                 child: Image(
//                   image: const AssetImage("images/58084 1.jpg"),
//                   height: 236.h,
//                   width: 235.w,
//                 ),
//               ),
//             ),
//             Text(
//               "Donate for our charity programmes",
//               style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
//             ),
//             Text(
//               "AC No:2535001000590",
//               style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
//             ),
//             Text(
//               "United Nurse Association Thrissur",
//               style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
//             ),
//             Text(
//               "IFSC:ICIC0002535",
//               style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
//             ),
//             Text(
//               "ICICI Bank,EastFort Branch",
//               style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
//             ),
//             Text(
//               "Thrissur",
//               style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 47),
//               child: Text(
//                 "OR",
//                 style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
//               ),
//             ),
//             SizedBox(
//               height: 20.h,
//             ),

//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.r),
//                 color: ThemeConstents.appPrimeryColor,
//               ),
//               height: 150,
//               width: 300,
//               child: Card(
//                 elevation: 4,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Form(
//                         key: fomKey,
//                         child: TextFormField(
//                           keyboardType: TextInputType.number,
//                           controller: amountControler,
//                           decoration: InputDecoration(
//                             hintText: "Enter a amount",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20),
//                               borderSide: const BorderSide(
//                                   width: 5,
//                                   color: Color.fromARGB(255, 95, 99, 98)),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Enter Amount';
//                             }

//                             return null;
//                           },
//                         ),
//                       ),
//                       ButtonWidget1(
//                         buttonname: "Online Payment",
//                         height: 34.h,
//                         width: 244.w,
//                         onclick: () {
//                           openCheckOut();
//                         },
//                       )
//                       // ButtonWidget(
//                       //     buttonname: "Online Payment",
//                       //     height: 34.h,
//                       //     width: 244.w),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10.h,
//             ),
//             // ButtonWidget(buttonname: "Card Payment", height: 34.h, width: 244.w),
//           ],
//         ),
//       ),
//     );
//   }

//   void openCheckOut() async {
//     var options = {
//       'key': 'rzp_live_odrmJ2TVl6Ux2P',
//       'amount':
//           (double.parse(amountControler.text) * 100.roundToDouble()).toString(),
//       'name': 'UNA',
//       'description': '',
//       'prefill': {'contact': '', 'email': ''},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint(e.toString());
//     }
//   }

//   PaymentSuccessResponse? response;
//   String successresponsepid = "";
//   String failureresponsepid = "";

//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {
//     log(response.paymentId.toString());

//     setState(() {
//       successresponsepid = response.paymentId.toString();
//     });

//     paymentModal.paymentResponse.paymentId = response.paymentId;
//     paymentModal.paymentResponse.status = "Success";
//     paymentModal.paymentResponse.amount = amountControler.text;
//     await paymentModal.payment(context);
//     log('Api hit');

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         padding: EdgeInsets.all(20),
//         backgroundColor: Colors.green,
//         duration: Duration(seconds: 5),
//         behavior: SnackBarBehavior.floating,
//         content: Text("Payment Success${response.paymentId}"),
//       ),
//     );
//   }

//   void _handlePaymentError(PaymentFailureResponse response) async {
//     log(response.message.toString());
//     log(response.code.toString());
//     log(response.error.toString());

//     setState(() {
//       failureresponsepid = response.code.toString();
//     });
//     paymentModal.paymentResponse.paymentId = response.error!["reason"];
//     paymentModal.paymentResponse.status = "Failure";
//     paymentModal.paymentResponse.amount = amountControler.text;
//     await paymentModal.payment(context);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         padding: EdgeInsets.all(20),
//         backgroundColor: Colors.red,
//         duration: Duration(seconds: 5),
//         behavior: SnackBarBehavior.floating,
//         content: Text("Payment Failed  ${response.message}"),
//       ),
//     );
//   }

//   void _handleExternalWallet(ExternalWalletResponse response) {
//     // Do something when an external wallet was selected
//   }
// }
