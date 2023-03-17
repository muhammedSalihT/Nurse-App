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
import 'package:project_una/widgets/bottom_nav.dart';

class SignInViewModel extends ChangeNotifier {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextControlller = TextEditingController();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final formKey = GlobalKey<FormState>();
  bool isSignInPasswordShowing = false;
  bool isSignInChecking = false;
  String? deviceToken;
  String tempPass = "123456";

  onSignInPasswordPressed() {
    isSignInPasswordShowing = !isSignInPasswordShowing;
    notifyListeners();
  }

  void getToken() async {
    _firebaseMessaging.getToken().then((value) async {
      SecureStore.saveFireBaseToken(value!);
      deviceToken = await SecureStore.getFiirbaseToken();
      notifyListeners();
    });
  }

  Future passwordReset(context) async {
    bool isInternet = await InternetConnectivity.checking();

    if (isInternet) {
      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailTextControlller.text.trim());
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            content: Text(
              "Password reset link sended to ${emailTextControlller.text.trim()}\nPlease check this email",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      } on FirebaseAuthException catch (e) {
        log(e.code.toString());
        if (e.code.toString() == "too-many-requests") {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              content: Text(
                "We have blocked all requests from this device due to unusual activity. Try again later.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        }

        if (e.code.toString() == "unknown") {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              content: Text(
                "Enter Your Registred Email In Login",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        }

        if (e.code.toString() == "user-not-found") {
          SnackBarWidget.getSnackBar(
              context: context, showText: "This Email Not Registred");
        }
      }
    } else {
      SnackBarWidget.getSnackBar(context: context, showText: "No Internet");
    }
  }

  signIn(context) async {
    isSignInChecking = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      bool isInternet = await InternetConnectivity.checking();
      if (isInternet) {
        getToken();
        // LoginControll datamodel = LoginControll();
        // datamodel.loginDtails(
        //     phone: emailTextControlller.text, deviceid: deviceToken);

        // LoginServices services = LoginServices();
        // services.login(datamodel.tojson()).then((value) => {
        //       debugPrint(value.message),
        //       SecureStore.saveBearertoken(value.token.toString()),
        //       Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) => UserBottomNav(),
        //       ))
        //     });
        // FirebaseAuth.instance
        //     .signInWithEmailAndPassword(
        //         email: emailTextControlller.text,
        //         password: passwordTextController.text)
        //     .then((value) {
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => UserBottomNav(),
        //       ));
        // }).onError((error, stackTrace) {
        //   log("Error ${error.toString()}");
        // });
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailTextControlller.text.trim(),
                  password: passwordTextController.text.trim())
              .then(
            (value) async {
              LoginControll datamodel = LoginControll();
              datamodel.loginDtails(
                  userPassword: tempPass,
                  userEmail: emailTextControlller.text.trim(),
                  deviceid: deviceToken ?? "Test");
              LoginServices services = LoginServices();
              Response responce = await services.login(datamodel.tojson());
              if (responce.statusCode == 200) {
                UserLogin data = UserLogin.fromJson(json.decode(responce.body));
                log(data.message.toString());
                if (data.profile!.expiryDate == null) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RegistartionScreen(),
                    ),
                  );
                  SecureStore.saveBearertoken(data.token.toString());
                  SecureStore.savePassword(passwordTextController.text.trim());
                  SecureStore.saveEmail(emailTextControlller.text.trim());
                  SnackBarWidget.getSnackBar(
                      context: context, showText: "Please Choose Any Category");
                  isSignInChecking = false;
                  notifyListeners();
                } else {
                  SnackBarWidget.getSnackBar(
                      context: context, showText: "Sign In Succesfuly");
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => UserBottomNav(),
                    ),
                    (route) => false,
                  );
                  SecureStore.saveUserExpDate(
                      data.profile!.expiryDate.toString());
                  SecureStore.saveBearertoken(data.token.toString());
                  SecureStore.savePassword(passwordTextController.text.trim());
                  SecureStore.saveEmail(emailTextControlller.text.trim());
                  SecureStore.saveUserType(data.type.toString());
                  isSignInChecking = false;
                  notifyListeners();
                }
              } else {
                SnackBarWidget.getSnackBar(
                    context: context,
                    showText: "Somthing Went Wrong,Try Again");
                isSignInChecking = false;
                notifyListeners();
              }
            },
          );
        } on FirebaseAuthException catch (e) {
          isSignInChecking = false;
          notifyListeners();
          log(e.code.toString());
          if (e.code == "user-not-found") {
            SnackBarWidget.getSnackBar(
                context: context, showText: "This Email Not Registred");
          }
          if (e.code == "wrong-password") {
            SnackBarWidget.getSnackBar(
                context: context, showText: "Incorrect Password");
          }
          if (e.code == "too-many-requests") {
            SnackBarWidget.getSnackBar(
                context: context, showText: "Incorrect Password");
          }
          isSignInChecking = false;
          notifyListeners();
          return Future.value(e.message);
        }
      } else {
        SnackBarWidget.getSnackBar(context: context, showText: "No Internet");
        isSignInChecking = false;
        notifyListeners();
      }
    } else {
      isSignInChecking = false;
      notifyListeners();
    }
  }
}
