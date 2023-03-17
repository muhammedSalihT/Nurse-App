import 'dart:io';

class UserLogin {
  String? type;
  Profile? profile;
  String? message;
  String? token;

  UserLogin({this.type, this.profile, this.message, this.token});

  UserLogin.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    data['message'] = message;
    data['token'] = token;
    return data;
  }
}

class Profile {
  int? id;
  int? uId;
  String? userName;
  String? name;
  String? address;
  String? email;
  String? whatsapp;
  String? gender;
  String? phoneNumber;
  File? photo;
  String? dob;
  int? pin;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;

  Profile(
      {this.id,
      this.uId,
      this.userName,
      this.name,
      this.address,
      this.email,
      this.whatsapp,
      this.gender,
      this.phoneNumber,
      this.photo,
      this.dob,
      this.pin,
      this.expiryDate,
      this.createdAt,
      this.updatedAt});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uId = json['u_id'];
    userName = json['user_name'];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    whatsapp = json['whatsapp'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    photo = File(json['photo'] ?? "");
    dob = json['dob'];
    pin = json['pin'];
    expiryDate = json['expiry_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['u_id'] = uId;
    data['user_name'] = userName;
    data['name'] = name;
    data['address'] = address;
    data['email'] = email;
    data['whatsapp'] = whatsapp;
    data['gender'] = gender;
    data['phone_number'] = phoneNumber;
    data['photo'] = photo;
    data['dob'] = dob;
    data['pin'] = pin;
    data['expiry_date'] = expiryDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
