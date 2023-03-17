class LoginControll {
  String? emailId;
  String? deviceToken;
  String? password;

  void loginDtails(
      {required String userEmail,
      required String deviceid,
      required String userPassword}) {
    emailId = userEmail;
    password = userPassword;
    deviceToken = deviceid;
  }

  Map<String, dynamic> tojson() {
    return {
      "phone": emailId,
      "password": password,
      "device_token": deviceToken,
    };
  }
}
