import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project_una/view/signin_screen.dart';
import 'package:project_una/widgets/bottom_nav.dart';

class SecureStore with ChangeNotifier {
  static String? storedemail;
  static Future<void> saveBearertoken(String token) async {
    const data = FlutterSecureStorage();
    await data.write(key: "Data", value: token);
    String? storedToken = await data.read(key: "Data");
    log("Bearertoken $storedToken");
  }

  static Future<String?> getBearertoken() async {
    const data = FlutterSecureStorage();
    String? storedToken = await data.read(key: "Data");
    log("get Bearer Token $storedToken");
    return storedToken;
  }

  static Future<void> saveEmail(String email) async {
    const data = FlutterSecureStorage();
    data.delete(key: "Email");
    await data.write(key: "Email", value: email);
  }

  static Future<void> savePassword(String pass) async {
    const data = FlutterSecureStorage();
    data.delete(key: "Pass");
    await data.write(key: "Pass", value: pass);
    log(pass.toString());
  }

  static Future<void> savePhoneNumber(String phone) async {
    const data = FlutterSecureStorage();
    data.delete(key: "Phone");
    await data.write(key: "Phone", value: phone);
  }

  static Future<String> getPhone() async {
    const data = FlutterSecureStorage();
    String? storedPhone = await data.read(key: "Phone");
    log("Saved Phone $storedPhone");
    return storedPhone.toString();
  }

  static Future<String> getEmail() async {
    const data = FlutterSecureStorage();
    String? storedEmail = await data.read(key: "Email");
    log("Saved email $storedEmail");
    return storedEmail.toString();
  }

  static Future<void> saveUserType(String type) async {
    const data = FlutterSecureStorage();
    data.delete(key: "Type");
    log("Saved Type $type");
    await data.write(key: "Type", value: type);
  }

  static getUserType() async {
    const data = FlutterSecureStorage();
    String? storedType = await data.read(key: "Type");
    log("Saved Type $storedType");
    return storedType;
  }

  static Future<void> saveUserExpDate(String date) async {
    const data = FlutterSecureStorage();
    data.delete(key: "Date");
    log("Saved Date ${date.toString().substring(0, 10).replaceRange(9, 10, (int.parse(date.toString().substring(9, 10)) + 1).toString())}");
    await data.write(key: "Date", value: date);
  }

  static Future<String?> getUserExpDate() async {
    const data = FlutterSecureStorage();
    String? storedDate = await data.read(key: "Date");
    if (storedDate == null) {
      return storedDate;
    } else {
      return storedDate.substring(0, 10).replaceRange(
          9,
          10,
          (int.parse(DateTime.now().toString().substring(9, 10)) + 1)
              .toString());
    }
  }

  static Future<void> checkLogin(context) async {
    String userEmail = await SecureStore.getEmail();
    String? userExpDate = await SecureStore.getUserExpDate();
    log("get Date $userExpDate");
    await Future.delayed(const Duration(seconds: 3));
    log(DateTime.now().toString());
    if (userExpDate == DateTime.now().toString().substring(0, 10)) {
      await SecureStore.logOutUser(context);
    } else {
      if (userEmail == "null") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (ctx) => const SignInScreen(),
            ),
            (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (ctx) => UserBottomNav(),
            ),
            (route) => false);
      }
    }
  }

  static logOutUser(BuildContext context) async {
    const login = FlutterSecureStorage();
    login.delete(key: "Data");
    login.delete(key: "Email");
    login.delete(key: "Phone");
    login.delete(key: "Pass");
    login.delete(key: "Type");
    login.delete(key: "Token");

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
      (route) => false,
    );
  }

  static void saveFireBaseToken(String firebsaetoken) async {
    const ftoken = FlutterSecureStorage();
    await ftoken.write(key: "Token", value: firebsaetoken);
    log("Saved fire Token $firebsaetoken");
  }

  static Future<String> getFiirbaseToken() async {
    const ftoken = FlutterSecureStorage();
    String? storedfToken = await ftoken.read(key: "Token");
    log("get FirBaseToken $storedfToken");
    return storedfToken.toString();
  }
}
