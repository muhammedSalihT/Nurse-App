import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:project_una/repository/usrls.dart';

class LoginServices {
  Future<http.Response> login(model) async {
    String uri = Urls.loginUrls;

    final response = await http.post(Uri.parse(uri), body: model);
    log(response.statusCode.toString());
    return response;
  }
}
