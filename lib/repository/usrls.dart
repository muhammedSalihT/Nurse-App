import 'package:project_una/helper/secure_storage.dart';

class Urls {
  static String loginUrls = "https://una.gitdr.com/api/userlogin";
}

class Token {
  static Map<String, String> headers = {
    "Authorization": "Bearer ${SecureStore.getBearertoken()}",
  };
}




class AppUrls {
  static const String userProfileUrl = "https://una.gitdr.com/api/userprofile";
  static const String baseUrl = "https://una.gitdr.com/";
  static const String getUserProfile =
      "https://una.gitdr.com/api/userprofile?phone=";


  static var transactionhistory =
      'https://una.gitdr.com/api/history?phone=${SecureStore.storedemail}';

  static var paymentpost = "https://una.gitdr.com/api/pay";

  static var donatepost = "https://una.gitdr.com/api/donation";
}
