class AccountModel {
  AccountModel({
    required this.data,
  });

  Data data;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.uId,
    required this.userName,
    required this.name,
    required this.address,
    required this.email,
    required this.whatsapp,
    required this.gender,
    required this.phoneNumber,
    required this.photo,
    required this.dob,
    this.pin,
    this.expiryDate,
    required this.createdAt,
    required this.updatedAt,
    required this.typeDetails,
  });

  int id;
  int uId;
  String userName;
  String? name;
  String? address;
  String email;
  String whatsapp;
  String gender;
  String phoneNumber;
  String? photo;
  String? dob;
  int? pin;
  dynamic expiryDate;
  DateTime createdAt;
  DateTime updatedAt;
  TypeDetails typeDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        uId: json["u_id"],
        userName: json["user_name"],
        name: json["name"] ?? "Unknown",
        address: json["address"] ?? "Unknown",
        email: json["email"] ?? "Unknown",
        whatsapp: json["whatsapp"] ?? "Unknown",
        gender: json["gender"] ?? "Unknown",
        phoneNumber: json["phone_number"] ?? "Unknown",
        photo: json["photo"].toString(),
        dob: json["dob"] ?? "Unknown",
        pin: json["pin"],
        expiryDate: json["expiry_date"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        typeDetails: TypeDetails.fromJson(json ["type_details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "u_id": uId,
        "user_name": userName,
        "name": name,
        "address": address,
        "email": email,
        "whatsapp": whatsapp,
        "gender": gender,
        "phone_number": phoneNumber,
        "photo": photo,
        "dob": dob,
        "pin": pin,
        "expiry_date": expiryDate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "type_details": typeDetails.toJson(),
      };
}

class TypeDetails {
  TypeDetails({
    required this.id,
    required this.uId,
    required this.userName,
    required this.course,
    required this.regno,
    required this.regState,
    required this.workingStatus,
    required this.workingPlace,
    this.instituteName,
    this.instituteDist,
    this.instituteState,
    this.instituteCountry,
    required this.remarks,
    this.expiryDate,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int uId;
  String userName;
  String? course;
  String? regno;
  String? regState;
  String? workingStatus;
  String? workingPlace;
  dynamic instituteName;
  dynamic instituteDist;
  dynamic instituteState;
  dynamic instituteCountry;
  String? remarks;
  dynamic expiryDate;
  DateTime createdAt;
  DateTime updatedAt;

  factory TypeDetails.fromJson(Map<String, dynamic> json) => TypeDetails(
        id: json["id"],
        uId: json["u_id"],
        userName: json["user_name"],
        course: json["course"],
        regno: json["regno"],
        regState: json["reg_state"],
        workingStatus: json["working_status"],
        workingPlace: json["working_place"],
        instituteName: json["institute_name"],
        instituteDist: json["institute_dist"],
        instituteState: json["institute_state"],
        instituteCountry: json["institute_country"],
        remarks: json["remarks"],
        expiryDate: json["expiry_date"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "u_id": uId,
        "user_name": userName,
        "course": course,
        "regno": regno,
        "reg_state": regState,
        "working_status": workingStatus,
        "working_place": workingPlace,
        "institute_name": instituteName,
        "institute_dist": instituteDist,
        "institute_state": instituteState,
        "institute_country": instituteCountry,
        "remarks": remarks,
        "expiry_date": expiryDate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
