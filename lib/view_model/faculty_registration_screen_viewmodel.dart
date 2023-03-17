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

class FacultyRegistrationViewModel with ChangeNotifier {
  bool checkboxvalue = false;
  dynamic workingfaculty;
  String? registrationState;
  String? placefaculty;
  String? workingContry;
  String? workingState;
  String? workingCity;
  final formKey = GlobalKey<FormState>();
  String? isWorking = "No";
  String? initialEmail;
  File? image1;

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

  DateTime? dob = DateTime.now();
  String? accountgender;
  bool isEditting = false;
  bool editaccount = false;
  String genterRadioLabel = "Genter";
  String workingRadioLabel = "Working Status";
  String workingPlaceRadioLabel = "Working Place";
  String registrationType = "faculty";

  getUserData() async {
    initialEmail = await SecureStore.getEmail();
    notifyListeners();
  }

  saveForm(context) async {
    isLoading = true;
    notifyListeners();
    if (formKey.currentState!.validate()) {
      if (isWorking == "Yes") {
        if (workingContry == null ||
            workingState == null ||
            workingCity == null) {
          isLoading = false;
          notifyListeners();
          return SnackBarWidget.getSnackBar(
              context: context,
              showText: "Please Select Your Hospital/Institute Adress");
        }
      } else if (registrationState == null) {
        isLoading = false;
        notifyListeners();
        return SnackBarWidget.getSnackBar(
            context: context, showText: "Please Select Registration State");
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
          regState: registrationState.toString(),
          workingStatus: isWorking.toString(),
          workingPlace: placefaculty.toString(),
          instituteName: "",
          instituteDist: "",
          instituteState: "",
          photo: image1,
          instituteCountry: "",
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
            selectedplan: "Faculty Plan",
            amount: "1",
            registrationModel: registrationModel),
      ));
    } else {
      SnackBarWidget.getSnackBar(
          context: context, showText: "Please Complete credentilas");
    }
    isLoading = false;
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

  changeaccountfieldstatus(bool value) {
    isEditting = !isEditting;
    editaccount = value;
    notifyListeners();
  }

  otpValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Pincode";
    }
    if (value == "Unknown") {
      return null;
    }
    if (value.length != 6) {
      return "Invalid Pincode";
    }
    return null;
  }

  chnagevalueincheckbox(bool value) {
    checkboxvalue = value;
    notifyListeners();
  }

  changeplacefaculty(String? value) {
    placefaculty = value;
    notifyListeners();
  }

  changeRegistrationState(String? value) {
    registrationState = value;
    notifyListeners();
  }

  changecountry(String value) {
    workingContry = value;
    notifyListeners();
  }

  changestate(String value) {
    if (value == "null") {
      return;
    }
    workingState = value;
    notifyListeners();
  }

  changecity(String value) {
    if (value == "null") {
      return;
    }
    workingCity = value;
    notifyListeners();
  }

  loadimage(File value) {
    image1 = value;
    notifyListeners();
  }

  // selectDate(BuildContext context) async {
  //   DateTime? newdate = await showDatePicker(
  //     context: context,
  //     initialDate: selecteddate,
  //     firstDate: DateTime(1990),
  //     lastDate: DateTime(2101),
  //   );
  //   if (newdate == null) {
  //     dateclicked = false;
  //   } else {
  //     dateclicked = true;
  //   }
  //   selecteddate = newdate!;
  //   notifyListeners();
  // }

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

  void selectimagefromcamera(BuildContext context) async {
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
