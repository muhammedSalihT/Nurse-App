// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:project_una/constants/theme/theme_constants.dart';
// import 'package:project_una/view_model/payment_screen_viewmodal.dart';
// import 'package:project_una/widgets/button_widgget.dart';
// import 'package:project_una/widgets/custom_appbar_widget.dart';
// import 'package:provider/provider.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// class AppWidget extends StatelessWidget {
//   const AppWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppbarWidget(
//         leadingIcon: Icon(
//           Icons.arrow_back_ios_new,
//           color: Colors.black,
//         ),
//         centerTitle: Container(
//           height: 40.h,
//           width: 134.w,
//           decoration: BoxDecoration(
//               color: ThemeConstents.appBodyColor,
//               image: DecorationImage(image: AssetImage("images/unalogo.png"))),
//         ),
//       ),
//       body: Payment(),
//     );
//   }
// }

// class Payment extends StatefulWidget {
//   const Payment({super.key});

//   @override
//   State<Payment> createState() => _PaymentState();
// }

// class _PaymentState extends State<Payment> {
//   late PaymentScreenViewModal paymentModal;
//   Razorpay _razorpay = Razorpay();
//   String amount = '1550';

//   @override
//   void initState() {
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     paymentModal = Provider.of<PaymentScreenViewModal>(context);

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.w),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "Select your Payment Gateway",
//             style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(
//             height: 24.h,
//           ),
//           Text(
//             "Payment Summary",
//             style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//           ),
//           SizedBox(
//             height: 22.h,
//           ),
//           Wrap(
//             children: [
//               Text(
//                 "Your Membership:",
//                 style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//               ),
//               Text(
//                 "Nurses registration",
//                 style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
//               ),
//             ],
//           ),
//           Text(
//             "Membership FEE:RS.1000(1Year),",
//             style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//           ),
//           Text(
//             "Welfare fund:Rs.500,",
//             style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//           ),
//           Text(
//             "Banking and Handling FEE:Rs.50",
//             style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//           ),
//           Wrap(
//             children: [
//               Text(
//                 "Membership Amount:",
//                 style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//               ),
//               Text(
//                 "$amount.00 INR",
//                 style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Wrap(
//             children: [
//               Text(
//                 "Final Payable Amount:",
//                 style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//               ),
//               Text(
//                 "$amount.00 INR",
//                 style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20.h,
//           ),
//           Text(
//             "Note:We are only accepting Indian Credit Cards/ Debit Cards/ Net banking/ UPI",
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(
//             height: 67.h,
//           ),
//           ButtonWidget(
//             buttonname: "Pay",
//             height: 34.h,
//             width: 114.w,
//             onclick: () {
//               openCheckOut(amount);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void openCheckOut(String amount) async {
//     var options = {
//       'key': 'rzp_live_odrmJ2TVl6Ux2P',
//       'amount': (double.parse(amount) * 100.roundToDouble()).toString(),
//       'name': 'UNA',
//       'description': '',
//       'prefill': {'contact': '9074691702', 'email': ''},
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
//     paymentModal.paymentResponse.amount = amount;
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
//     paymentModal.paymentResponse.amount = amount;
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
