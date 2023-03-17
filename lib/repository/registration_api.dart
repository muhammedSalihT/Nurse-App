import 'dart:developer';
import 'package:project_una/helper/secure_storage.dart';
import 'package:project_una/model/registration_model.dart';
import 'package:project_una/repository/usrls.dart';
import 'package:project_una/utils/internet_connectivity.dart';
import 'package:http/http.dart' as http;
import 'package:project_una/utils/snackbar.dart';

class RegistrationApi {
  static Future<int?> registerUser(
      RegistrationModel registrationModel, context) async {
    try {
      bool result = await InternetConnectivity.checking();
      String? bearerToken = await SecureStore.getBearertoken();
      log(bearerToken.toString());
      if (result) {
        var request =
            http.MultipartRequest('POST', Uri.parse(AppUrls.userProfileUrl));
        Map<String, String> headers = {
          "Authorization": "Bearer $bearerToken",
        };
        request.headers.addAll(headers);
        request.fields['username'] = registrationModel.username.toString();
        request.fields['name'] = registrationModel.name.toString();
        request.fields['address'] = registrationModel.address.toString();
        request.fields['email'] = registrationModel.email.toString();
        request.fields['gender'] = registrationModel.gender.toString();
        request.fields['pin'] = registrationModel.pin.toString();
        request.fields['regno'] = registrationModel.regno.toString();
        request.fields['reg_state'] = registrationModel.regState.toString();
        request.fields['working_status'] =
            registrationModel.workingStatus.toString();
        request.fields['working_place'] =
            registrationModel.workingPlace.toString();
        request.fields['institute_name'] =
            registrationModel.instituteName.toString();
        request.fields['institute_dist'] =
            registrationModel.instituteDist.toString();
        request.fields['institute_state'] =
            registrationModel.instituteState.toString();
        request.fields['institute_country'] =
            registrationModel.instituteCountry.toString();
        request.fields['dob'] = registrationModel.dob.toString();
        request.fields['type'] = registrationModel.type.toString();
        request.fields['whatsapp'] = registrationModel.whatsapp.toString();
        request.fields['course'] = registrationModel.course.toString();
        request.fields['remarks'] = registrationModel.remarks.toString();
        if (registrationModel.photo != null) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'photo',
              registrationModel.photo!.path,
            ),
          );
        } else {
          request.fields['photo'] = registrationModel.photo.toString();
        }

        var res = await request.send();
        log(res.statusCode.toString());
        if (res.statusCode == 200) {
          return res.statusCode;
        } else {
          SnackBarWidget.getSnackBar(
              context: context, showText: "Somthing Went Wrong");
        }
      } else {
        SnackBarWidget.getSnackBar(context: context, showText: "No Internet");
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
