// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:project_una/widgets/button_widget/button_widgget.dart';

// import '../widgets/bottom_nav/bottom_nav_icons.dart';

// class PaymentSectionPage extends StatelessWidget {
//   const PaymentSectionPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: const UserBottomIcons(),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Select your Payment Gateway",
//               style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(
//               height: 24.h,
//             ),
//             Text(
//               "Payment Summary",
//               style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//             ),
//             SizedBox(
//               height: 22.h,
//             ),
//             Wrap(
//               children: [
//                 Text(
//                   "Your Membership:",
//                   style:
//                       TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//                 ),
//                 Text(
//                   "Nurses registration",
//                   style:
//                       TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//             Text(
//               "Membership FEE:RS.1000(1Year),",
//               style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//             ),
//             Text(
//               "Welfare fund:Rs.500,",
//               style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//             ),
//             Text(
//               "Banking and Handling FEE:Rs.50",
//               style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//             ),
//             Wrap(
//               children: [
//                 Text(
//                   "Membership Amount:",
//                   style:
//                       TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//                 ),
//                 Text(
//                   "1,550.00 INR",
//                   style:
//                       TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Wrap(
//               children: [
//                 Text(
//                   "Final Payable Amount:",
//                   style:
//                       TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
//                 ),
//                 Text(
//                   "1,550.00 INR",
//                   style:
//                       TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Text(
//               "Note:We are only accepting Indian Credit Cards/ Debit Cards/ Net banking/ UPI",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(
//               height: 67.h,
//             ),
//             ButtonWidget(buttonname: "Pay", height: 34.h, width: 114.w),
//           ],
//         ),
//       ),
//     );
//   }
// }
