import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_una/constants/theme/theme_constants.dart';
import 'package:project_una/helper/secure_storage.dart';
import 'package:project_una/model/registration_model.dart';
import 'package:project_una/repository/account_api.dart';
import 'package:project_una/utils/internet_connectivity.dart';
import 'package:project_una/utils/snackbar.dart';
import 'package:project_una/view_model/payment_screen_viewmodal.dart';
import 'package:project_una/widgets/bottom_nav.dart';
import 'package:project_una/widgets/button_widgget.dart';
import 'package:project_una/widgets/custom_appbar_widget.dart';
import 'package:project_una/widgets/wrapwidget.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class OtherPaymentSectionScreen extends StatefulWidget {
  OtherPaymentSectionScreen(
      {super.key,
      required this.selectedplan,
      required this.amount,
      required this.registrationModel});

  String selectedplan;
  String amount;
  RegistrationModel registrationModel;

  @override
  State<OtherPaymentSectionScreen> createState() =>
      _OtherPaymentSectionScreenState();
}

class _OtherPaymentSectionScreenState extends State<OtherPaymentSectionScreen> {
  late PaymentScreenViewModal paymentModal;
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    paymentModal = Provider.of<PaymentScreenViewModal>(context);

    return Scaffold(
      backgroundColor: ThemeConstents.appBodyColor,
      appBar: CustomAppbarWidget(
        leadingIcon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        centerTitle: Container(
          height: 40.h,
          width: 134.w,
          decoration: BoxDecoration(
            color: ThemeConstents.appBodyColor,
            image: const DecorationImage(
              image: AssetImage("images/unalogo.png"),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select your Payment Gateway\nFor Complete Registration",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Payment Summary",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 22.h,
            ),
            WrapWidget(
                firsttext: "Your currently selected plan :",
                secondtext: widget.selectedplan),
            WrapWidget(firsttext: " Plan Amount : ", secondtext: widget.amount),
            WrapWidget(
                firsttext: "Coupon Discount Amount :", secondtext: "0.00 INR"),
            WrapWidget(
                firsttext: "Final Payable Amount: ", secondtext: widget.amount),
            SizedBox(
              height: 20.h,
            ),
            ButtonWidget(
              buttonname: "Pay",
              height: 34.h,
              width: 114.w,
              onclick: () {
                openCheckOut(widget.amount.toString());
              },
            )
          ],
        ),
      ),
    );
  }

  void openCheckOut(String amount) async {
    bool isInternet = await InternetConnectivity.checking();
    if (isInternet == true) {
      var options = {
        'key': 'rzp_test_2Gu7dLidKZIpTx',
        'amount': (double.parse(amount) * 100.roundToDouble()).toString(),
        'name': 'UNA',
        'description': '',
        'prefill': {'contact': '9074691702', 'email': ''},
        'external': {
          'wallets': ['paytm']
        }
      };
      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      SnackBarWidget.getSnackBar(context: context, showText: "No Internet");
    }
  }

  PaymentSuccessResponse? response;
  String successresponsepid = "";
  String failureresponsepid = "";

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log(response.paymentId.toString());

    setState(() {
      successresponsepid = response.paymentId.toString();
    });

    paymentModal.paymentResponse.paymentId = response.paymentId;
    paymentModal.paymentResponse.status = "Success";
    paymentModal.paymentResponse.amount = widget.amount;
    paymentModal.paymentResponse.phone = widget.registrationModel.username;
    await paymentModal.payment(context);
    log('Api hit');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        content: Text("Payment Success,Please Wait..."),
      ),
    );
    SnackBarWidget.getSnackBar(
        context: context, showText: "Registration Completed");
    SecureStore.saveUserType(widget.registrationModel.type.toString());
    String userEmail = await SecureStore.getEmail();
    String? userToken = await SecureStore.getBearertoken();
    final data = await AccountApi.fetchAccountDetails(
        userToken: userToken, userEmail: userEmail);
    await SecureStore.saveUserExpDate(data.data.expiryDate);
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => UserBottomNav(),
      ),
      (route) => false,
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) async {
    log(response.message.toString());
    log(response.code.toString());
    log(response.error.toString());

    setState(() {
      failureresponsepid = response.code.toString();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        content: Text("Payment Failed "),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
}
