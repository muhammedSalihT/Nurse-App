import 'dart:convert';
import 'dart:io';
import "package:http/http.dart" as http;
import 'package:project_una/data/Network/baseapiservices.dart';
import 'package:project_una/data/app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
//get api response

  @override
  Future getGetApiResponse(String url, Map<String, String>? header) async {
    dynamic responseJson;

    try {
      final response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

//post api response

  @override
  Future getPostApiResponse(
      String url, dynamic data, Map<String, String>? header) async {
    dynamic responseJson;

    try {
      final response = await http
          .post(Uri.parse(url), headers: header, body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
          'Error occurred while communicating with server' +
              'with status code' +
              response.statusCode.toString(),
        );
    }
  }
}
