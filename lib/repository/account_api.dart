import 'dart:convert';
import 'dart:developer';
import 'package:project_una/model/account_model.dart';
import 'package:http/http.dart' as http;
import 'package:project_una/repository/usrls.dart';

class AccountApi {
  static Future<AccountModel> fetchAccountDetails(
      {required dynamic userToken, required String userEmail}) async {
    try {
      final response = await http.get(
          Uri.parse("${AppUrls.getUserProfile}$userEmail"),
          headers: {'Authorization': "Bearer $userToken"});
      log(response.statusCode.toString());
      return AccountModel.fromJson(
        jsonDecode(response.body),
      );
    } catch (e) {
      rethrow;
    }
  }
}
