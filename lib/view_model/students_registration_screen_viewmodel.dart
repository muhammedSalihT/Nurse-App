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
import 'package:project_una/widgets/bottom_nav.dart';

class StudentRegistrationViewModel with ChangeNotifier {
  final studentformKey = GlobalKey<FormState>();
  File? image1;
  dynamic studentgender;
  dynamic studentcourse;
  bool checkboxvalue = false;
  bool dateclicked = false;
  DateTime? selecteddate;
  String? countryValue;
  String? stateValue;
  String? cityValue;
  String? initialEmail;
  DateTime? dob = DateTime.now();
  bool isLoading = false;
  bool isSkip = false;
  String registrationType = "student";

  TextEditingController firstnameController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController regnoController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController instituteNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  goToHome(context) async {
    isSkip = true;
    notifyListeners();
    String userEmail = await SecureStore.getEmail();
    RegistrationModel registrationModel = RegistrationModel(
      username: userEmail,
      name: "Unknown",
      address: "Unknown",
      email: "Unknown",
      whatsapp: "Unknown",
      gender: "Unknown",
      pin: "1",
      type: "guest",
    );
    final int? code =
        await RegistrationApi.registerUser(registrationModel, context);
    if (code == 200) {
      isSkip = false;
      notifyListeners();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => UserBottomNav(),
          ),
          (route) => false);
    } else {
      isSkip = false;
      notifyListeners();
      SnackBarWidget.getSnackBar(
          context: context, showText: "Somthing Went Wrong");
    }
  }

  changestudentgender(dynamic value) {
    studentgender = value;
    notifyListeners();
  }

  getUserData() async {
    initialEmail = await SecureStore.getEmail();
    notifyListeners();
  }

  changestudentcourse(dynamic value) {
    studentcourse = value;
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

  emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Email";
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Invalid Email";
    }
    return null;
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

  loadimage(File value) {
    image1 = value;
    notifyListeners();
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

  chnagevalueincheckbox(bool value) {
    checkboxvalue = value;
    notifyListeners();
    log(checkboxvalue.toString());
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

  selectDate(BuildContext context) async {
    DateTime? newdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2101),
    );
    if (newdate == null) {
      dateclicked = false;
    } else {
      dateclicked = true;
    }
    selecteddate = newdate!;
    notifyListeners();
  }

  saveForm(context) async {
    isLoading = true;
    notifyListeners();
    if (studentformKey.currentState!.validate()) {
      if (countryValue == null || stateValue == null || cityValue == null) {
        isLoading = false;
        notifyListeners();
        return SnackBarWidget.getSnackBar(
            context: context, showText: "Please Select Your Location Adress");
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
        gender: studentgender.toString(),
        pin: pinController.text,
        type: registrationType,
        regno: "",
        regState: "",
        workingStatus: "",
        workingPlace: "",
        instituteName: instituteNameController.text,
        instituteDist: cityValue.toString(),
        instituteState: stateValue.toString(),
        photo: image1,
        course: studentcourse.toString(),
        remarks: remarksController.text.toString(),
        instituteCountry: countryValue.toString(),
        dob: dateOfBirthController.text.toString(),
      );
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
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OtherPaymentSectionScreen(
              selectedplan: "Nursing Students",
              amount: "105",
              registrationModel: registrationModel),
        ),
      );
      isLoading = false;
      notifyListeners();
    } else {
      SnackBarWidget.getSnackBar(
          context: context, showText: "Please Complete credentilas");
      isLoading = false;
      notifyListeners();
    }
  }
}
