import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:project_una/helper/secure_storage.dart';
import 'package:project_una/model/registration_model.dart';
import 'package:project_una/repository/registration_api.dart';
import 'package:project_una/utils/snackbar.dart';
import 'package:project_una/view/other_payment_section_screen.dart';

class OtherHealthCareWorkersViewModel with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  dynamic gender;
  dynamic working;
  dynamic place;
  bool checkboxvalue = false;
  String? isWorking = "No";
  DateTime? selecteddate;
  File? image1;
  bool imagesel = false;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  String? initialEmail;
  DateTime? dob = DateTime.now();
  String? accountgender;
  String genterRadioLabel = "Genter";
  String workingRadioLabel = "Working Status";
  String workingPlaceRadioLabel = "Working Place";
  String? placefaculty;
  String registrationType = "health";
  bool isLoading = false;

  TextEditingController firstnameController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController regnoController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController hospitalnameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  getUserData() async {
    initialEmail = await SecureStore.getEmail();
    notifyListeners();
  }

  saveForm(context) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      if (isWorking == "Yes") {
        if (countryValue == null || stateValue == null || cityValue == null) {
          isLoading = false;
          notifyListeners();
          return SnackBarWidget.getSnackBar(
              context: context,
              showText: "Please Select Your Organisation Adress");
        }
      } else if (pinController.text.length != 6 &&
          pinController.text.isNotEmpty) {
        isLoading = false;
        notifyListeners();
        return SnackBarWidget.getSnackBar(
            context: context, showText: "Invalid Pincode");
      }
      RegistrationModel registrationModel = RegistrationModel(
          username: initialEmail.toString(),
          name: "${firstnameController.text} ${lastnameController.text}",
          address: addressController.text,
          email: phoneController.text,
          whatsapp: whatsappController.text,
          gender: accountgender.toString(),
          pin: pinController.text,
          type: registrationType,
          regno: regnoController.text.toString(),
          regState: "",
          workingStatus: isWorking.toString(),
          workingPlace: placefaculty.toString(),
          instituteName: hospitalnameController.text,
          instituteDist: cityValue.toString(),
          instituteState: stateValue.toString(),
          photo: image1,
          instituteCountry: countryValue.toString(),
          dob: dateOfBirthController.text.toString(),
          course: "",
          remarks: remarksController.text.toString());
      final int? code =
          await RegistrationApi.registerUser(registrationModel, context);
      if (code == 200) {
        SnackBarWidget.getSnackBar(
            context: context,
            showText: "Make Payment For Registration Complete");
      } else {
        SnackBarWidget.getSnackBar(
            context: context, showText: "Somthing Went Wrong");
        isLoading = false;
        notifyListeners();
      }
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => OtherPaymentSectionScreen(
            selectedplan: "Other Health",
            amount: "1550",
            registrationModel: registrationModel),
      ));
    } else {
      SnackBarWidget.getSnackBar(
          context: context, showText: "Please Complete credentials");
    }
    isLoading = false;
    notifyListeners();
  }

  changeworking(dynamic value) {
    working = value;
    notifyListeners();
    log(working.toString());
  }

  changeaccountgender(dynamic value) {
    accountgender = value;
    notifyListeners();
  }

  validatingFunction(value, String validatingHint) {
    if (value == null) {
      return "Select $validatingHint";
    }
    return null;
  }

  selectWorking(String? selectedValue) {
    isWorking = selectedValue;
    notifyListeners();
  }

  changeplacefaculty(String? value) {
    placefaculty = value;
    notifyListeners();
  }

  changecountry(String value) {
    countryValue = value;
    notifyListeners();
  }

  changestate(String value) {
    if (value == "null") {
      return;
    }
    stateValue = value;
    notifyListeners();
  }

  changecity(String value) {
    if (value == "null") {
      return;
    }
    cityValue = value;
    notifyListeners();
  }

  otpValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Pincode";
    }
    if (value.length != 6) {
      return "Invalid Pincode";
    }
    return null;
  }

  emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Email";
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Invalid Email";
    }
    return null;
  }

  chnagevalueincheckbox(bool value) {
    checkboxvalue = value;
    notifyListeners();
    log(checkboxvalue.toString());
  }

  clickimagefield(bool imgselected) {
    imagesel = imgselected;
    notifyListeners();
  }

  loadimage(File value) {
    image1 = value;
    notifyListeners();
  }

  takeDateOfBirth(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateFormat("yyyy-MM-dd").parse(dob.toString()),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (newDate == null) {
      return;
    } else {
      dob = newDate;
      dateOfBirthController.text =
          '${newDate.day}/${newDate.month}/${newDate.year}';
      notifyListeners();
    }
  }

  selectimagefromgallery(BuildContext context) async {
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

  selectimagefromcamera(BuildContext context) async {
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

  removephoto() {
    image1 = null;
    notifyListeners();
  }
}
