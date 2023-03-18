// import 'dart:developer';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:project_una/Controlls/login_controll.dart';
// import 'package:project_una/helper/secure_storage.dart';
// import 'package:project_una/repository/login_repository.dart';
// import 'package:project_una/utils/internet_connectivity.dart';
// import 'package:project_una/utils/snackbar.dart';
// import 'package:project_una/view/registartion.dart';

// class AuthenticationViewModel with ChangeNotifier {
//   TextEditingController emailTextControlller = TextEditingController();
//   TextEditingController passwordTextController = TextEditingController();
//   bool isSignUpChecking = false;
//   bool isSignUpPasswordShowing = false;
//   final signUpKey = GlobalKey<FormState>();
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   String? deviceToken;

//   onSignUpPasswordPressed() {
//     isSignUpPasswordShowing = !isSignUpPasswordShowing;
//     notifyListeners();
//   }

//   void getToken() async {
//     _firebaseMessaging.getToken().then((value) async {
//       SecureStore.saveFireBaseToken(value!);
//       deviceToken = await SecureStore.getFiirbaseToken();
//       notifyListeners();
//     });
//   }

//   userSignUp(context) async {
//     isSignUpChecking = true;
//     notifyListeners();
//     if (signUpKey.currentState!.validate()) {
//       bool isInternet = await InternetConnectivity.checking();
//       if (isInternet) {
//         getToken();
//         try {
//           await FirebaseAuth.instance
//               .createUserWithEmailAndPassword(
//                   email: emailTextControlller.text,
//                   password: passwordTextController.text)
//               .then(
//             (value) {
//               LoginControll datamodel = LoginControll();
//               datamodel.loginDtails(
//                   userPassword: passwordTextController.text,
//                   userEmail: emailTextControlller.text,
//                   deviceid: deviceToken ?? "Test");
//               LoginServices services = LoginServices();
//               services.login(datamodel.tojson()).then(
//                     (value) => {
//                       if (value.token != null)
//                         {
//                           SecureStore.saveBearertoken(value.token.toString()),
//                           SecureStore.savePassword(passwordTextController.text),
//                           SecureStore.saveEmail(emailTextControlller.text),
//                           emailTextControlller.clear(),
//                           passwordTextController.clear(),
//                           isSignUpPasswordShowing = false,
//                           SnackBarWidget.getSnackBar(
//                               context: context, showText: "Sign Up Succesfuly"),
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => const RegistartionScreen(),
//                             ),
//                           ),
//                           isSignUpChecking = false,
//                           notifyListeners(),
//                         }
//                       else
//                         {
//                           SnackBarWidget.getSnackBar(
//                               context: context,
//                               showText: "Somthing Went Wrong"),
//                           isSignUpChecking = false,
//                           notifyListeners(),
//                         }
//                     },
//                   );
//             },
//           );
//         } on FirebaseAuthException catch (e) {
//           isSignUpChecking = false;
//           notifyListeners();
//           log(e.code.toString());
//           if (e.code == "email-already-in-use") {
//             SnackBarWidget.getSnackBar(
//                 context: context, showText: "This Email Already Registred");
//           }
//           if (e.code == "invalid-email") {
//             SnackBarWidget.getSnackBar(
//                 context: context, showText: "Invalid Email");
//           }
//           isSignUpChecking = false;
//           notifyListeners();
//           return Future.value(e.message);
//         }
//       } else {
//         SnackBarWidget.getSnackBar(context: context, showText: "No Internet");
//         isSignUpChecking = false;
//         notifyListeners();
//       }
//     } else {
//       isSignUpChecking = false;
//       notifyListeners();
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_una/Controlls/login_controll.dart';
import 'package:project_una/helper/secure_storage.dart';
import 'package:project_una/model/login_model.dart';
import 'package:project_una/repository/login_repository.dart';
import 'package:project_una/utils/internet_connectivity.dart';
import 'package:project_una/utils/snackbar.dart';
import 'package:project_una/view/registartion.dart';

class AuthenticationViewModel with ChangeNotifier {
  TextEditingController emailTextControlller = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool isSignUpChecking = false;
  bool isSignUpPasswordShowing = false;
  bool isEmailVerify = false;
  final signUpKey = GlobalKey<FormState>();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? deviceToken;
  Timer? countTime;
  int start = 60;
  bool isVerified = false;

  final auth = FirebaseAuth.instance;
  User? user;
  Timer? timer;

  onSignUpPasswordPressed() {
    isSignUpPasswordShowing = !isSignUpPasswordShowing;
    notifyListeners();
  }

  void getToken() async {
    _firebaseMessaging.getToken().then((value) async {
      SecureStore.saveFireBaseToken(value!);
      deviceToken = await SecureStore.getFiirbaseToken();
      notifyListeners();
    });
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    countTime = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
          notifyListeners();
        }
      },
    );
  }

  Future<void> checkEmailVerified(context) async {
    user = auth.currentUser;
    await user!.reload();
    log(user!.emailVerified.toString());
    if (user!.emailVerified) {
      timer!.cancel();
      isVerified = true;
      isEmailVerify = false;
      notifyListeners();
      LoginControll datamodel = LoginControll();
      datamodel.loginDtails(
          userPassword: passwordTextController.text.trim(),
          userEmail: emailTextControlller.text.trim(),
          deviceid: deviceToken ?? "Test");
      LoginServices services = LoginServices();
      Response responce = await services.login(datamodel.tojson());
      if (responce.statusCode == 200) {
        UserLogin data = UserLogin.fromJson(json.decode(responce.body));
        if (data.token != null) {
          SecureStore.saveBearertoken(data.token.toString());
          SecureStore.savePassword(passwordTextController.text.trim());
          SecureStore.saveEmail(emailTextControlller.text.trim());
          isSignUpPasswordShowing = false;
          SnackBarWidget.getSnackBar(
              context: context, showText: "Sign Up Succesfuly");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const RegistartionScreen(),
            ),
          );
          isVerified = false;
          isSignUpChecking = false;
          timer!.cancel();
          notifyListeners();
        }
      } else {
        SnackBarWidget.getSnackBar(
            context: context, showText: "Somthing Went Wrong,Try Again");
        isVerified = false;
        timer!.cancel();
        isSignUpChecking = false;
        notifyListeners();
      }
    }
  }

  userSignUp(context) async {
    if (signUpKey.currentState!.validate()) {
      bool isInternet = await InternetConnectivity.checking();
      if (isInternet) {
        isSignUpChecking = true;
        notifyListeners();
        getToken();
        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
            email: emailTextControlller.text.trim(),
            password: passwordTextController.text.trim(),
          )
              .then(
            (value) async {
              user = auth.currentUser;
              user!.sendEmailVerification();
              SnackBarWidget.getSnackBar(
                  context: context,
                  showText: "Verification Link Sended To Email");
              isEmailVerify = true;
              start = 60;
              notifyListeners();
              startTimer();
              timer = Timer.periodic(const Duration(seconds: 2), (timer) {
                checkEmailVerified(context);
              });
              await Future.delayed(const Duration(minutes: 1));
              if (!user!.emailVerified) {
                isSignUpChecking = false;
                isEmailVerify = false;
                notifyListeners();
                timer!.cancel();
                user!.delete();
                SnackBarWidget.getSnackBar(
                    context: context, showText: "Verification Not Completed");
              }
            },
          );
        } on FirebaseAuthException catch (e) {
          isSignUpChecking = false;
          notifyListeners();
          log(e.code.toString());
          if (e.code == "email-already-in-use") {
            SnackBarWidget.getSnackBar(
                context: context, showText: "This Email Already Registred");
          }
          if (e.code == "invalid-email") {
            SnackBarWidget.getSnackBar(
                context: context, showText: "Invalid Email");
          }
          isSignUpChecking = false;
          notifyListeners();
          return Future.value(e.message);
        }
      } else {
        SnackBarWidget.getSnackBar(context: context, showText: "No Internet");
        isSignUpChecking = false;
        notifyListeners();
      }
    } else {
      isSignUpChecking = false;
      notifyListeners();
    }
  }
}
