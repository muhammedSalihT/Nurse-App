import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:project_una/helper/secure_storage.dart';
import 'package:project_una/model/account_model.dart';
import 'package:project_una/model/registration_model.dart';
import 'package:project_una/repository/account_api.dart';
import 'package:project_una/repository/registration_api.dart';
import 'package:project_una/utils/internet_connectivity.dart';
import 'package:project_una/utils/snackbar.dart';

class AccountScreenViewModel with ChangeNotifier {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nativeAdressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController radioController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();

  dynamic accountgender;
  bool isSaving = false;
  var formKey = GlobalKey<FormState>();
  bool isEditting = false;
  String? image;
  bool? isInternet = true;
  String? initialPhoneNumber;
  AccountModel? accountModel;
  File? fileImage;
  String? userEmail;
  List<AccountModel?> dataList = [];

  checkingInternet() async {
    isInternet = await InternetConnectivity.checking();
    notifyListeners();
  }

  getAccountData(dynamic context) async {
    checkingInternet();
    String userEmail = await SecureStore.getEmail();
    notifyListeners();
    userEmail = userEmail;
    String? userToken = await SecureStore.getBearertoken();
    final data = await AccountApi.fetchAccountDetails(
        userToken: userToken, userEmail: userEmail);
    accountModel = data;
    notifyListeners();
    image = data.data.photo;
    firstNameController.text = data.data.name ?? "Unknown";
    phoneController.text = data.data.email;
    whatsappController.text = data.data.whatsapp;
    accountgender = data.data.gender;
    dateOfBirthController.text =
        data.data.dob == "null" ? "Unknown" : data.data.dob.toString();
    nativeAdressController.text = data.data.address ?? "Unknown";
    pinCodeController.text =
        data.data.pin.toString() == "1" ? "Unknown" : data.data.pin.toString();
    dataList.clear();
    dataList.add(accountModel);
    log(image.toString());
    notifyListeners();
  }

  dynamic changeaccountgender(dynamic value) {
    log("call genter function");
    accountgender = value;
    notifyListeners();
  }

  takeDateOfBirth(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateFormat("dd/MM/yyyy").parse(dateOfBirthController.text),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (newDate == null) {
      return;
    } else {
      dateOfBirthController.text =
          '${newDate.day}/${newDate.month}/${newDate.year}';
      notifyListeners();
      log(dateOfBirthController.text.toString());
    }
  }

  changeaccountfieldstatus() {
    isEditting = !isEditting;
    log(isEditting.toString());
    notifyListeners();
  }

  // validateEmail(String email) {
  //   String pattern = r'\w+@\w+\.\w+';
  //   RegExp regex = RegExp(pattern);
  //   final value = regex.hasMatch(email);
  //   if (email.isEmpty) {
  //     return "Enter Email";
  //   }
  //   if (value == false) {
  //     return "Invalid Email";
  //   }
  //   return null;
  // }

  Future showimageSource(
      {BuildContext? context,
      VoidCallback? showimagegallery,
      VoidCallback? showimagecamera}) async {
    if (Platform.isAndroid) {
      return showModalBottomSheet(
        context: context!,
        builder: (context) => SizedBox(
          height: 130,
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Gallery"),
                onTap: () {
                  showimagegallery!();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("camera"),
                onTap: () {
                  showimagecamera!();
                },
              ),
            ],
          ),
        ),
      );
    }
  }

  loadimage(File value) {
    fileImage = value;
    log(fileImage.toString());
    notifyListeners();
  }

  selectimagefromgallery(context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTempororay = File(image.path);
      loadimage(imageTempororay);
    } on PlatformException catch (e) {
      debugPrint("failed to pick image:$e");
    }

    Navigator.of(context).pop(ImageSource.gallery);
  }

  selectimagefromcamera(context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      }
      final imageTempororay = File(image.path);
      loadimage(imageTempororay);
    } on PlatformException catch (e) {
      debugPrint("failed to pick image:$e");
    }

    Navigator.of(context).pop(ImageSource.camera);
  }

  saveDetails(context) async {
    String? userType = await SecureStore.getUserType();
    isSaving = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      RegistrationModel registrationModel = RegistrationModel(
        username: accountModel!.data.userName,
        name: firstNameController.text,
        address: nativeAdressController.text,
        email: phoneController.text,
        whatsapp: whatsappController.text,
        gender: accountgender,
        pin: pinCodeController.text == "Unknown" ? "1" : pinCodeController.text,
        type: userType.toString() == "null" ? "student" : userType.toString(),
        regno: accountModel!.data.typeDetails.regno.toString(),
        regState: accountModel!.data.typeDetails.regState.toString(),
        workingStatus: accountModel!.data.typeDetails.workingStatus.toString(),
        workingPlace: accountModel!.data.typeDetails.workingPlace.toString(),
        instituteName: accountModel!.data.typeDetails.instituteName.toString(),
        instituteDist: accountModel!.data.typeDetails.instituteDist.toString(),
        instituteState:
            accountModel!.data.typeDetails.instituteState.toString(),
        photo: fileImage,
        instituteCountry:
            accountModel!.data.typeDetails.instituteCountry.toString(),
        dob: dateOfBirthController.text.toString(),
        course: accountModel!.data.typeDetails.course.toString(),
        remarks: accountModel!.data.typeDetails.remarks.toString(),
      );
      final int? code =
          await RegistrationApi.registerUser(registrationModel, context);
      if (code == 200) {
        isSaving = false;
        notifyListeners();
        SnackBarWidget.getSnackBar(context: context, showText: "Updated");
        changeaccountfieldstatus();
      }
    } else {
      isSaving = false;
      notifyListeners();
      SnackBarWidget.getSnackBar(
          context: context, showText: "Please Complete Credentials");
    }
  }
}
