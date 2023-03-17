import 'dart:io';

class RegistrationModel {
  RegistrationModel({
     this.username,
     this.name,
     this.address,
     this.email,
     this.gender,
     this.pin,
     this.regno,
     this.regState,
     this.workingStatus,
     this.workingPlace,
     this.instituteName,
     this.instituteDist,
     this.instituteState,
     this.instituteCountry,
     this.dob,
    this.photo,
     this.type,
     this.whatsapp,
     this.course,
     this.remarks,
  });

  String? username;
  String? name;
  String? address;
  String? email;
  String? gender;
  String? pin;
  String? regno;
  String? regState;
  String? workingStatus;
  String? workingPlace;
  String? instituteName;
  String? instituteDist;
  String? instituteState;
  String? instituteCountry;
  String? dob;
  File? photo;
  String? type;
  String? whatsapp;
  String? course;
  String? remarks;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        username: json["username"],
        name: json["name"],
        address: json["address"],
        email: json["email"],
        gender: json["gender"],
        pin: json["pin"],
        regno: json["regno"],
        regState: json["reg_state"],
        workingStatus: json["working_status"],
        workingPlace: json["working_place"],
        instituteName: json["institute_name"],
        instituteDist: json["institute_dist"],
        instituteState: json["institute_state"],
        instituteCountry: json["institute_country"],
        dob: json["dob"],
        photo: json["Photo"],
        type: json["type"],
        whatsapp: json["whatsapp"],
        course: json["course"],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "name": name,
        "address": address,
        "email": email,
        "gender": gender,
        "pin": pin,
        "regno": regno,
        "reg_state": regState,
        "working_status": workingStatus,
        "working_place": workingPlace,
        "institute_name": instituteName,
        "institute_dist": instituteDist,
        "institute_state": instituteState,
        "institute_country": instituteCountry,
        "dob": dob,
        "Photo": photo,
        "type": type,
        "whatsapp": whatsapp,
        "course": course,
        "remarks": remarks,
      };
}
