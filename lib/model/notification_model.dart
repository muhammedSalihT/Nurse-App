class NotificationModel {
  int? id;
  String? notificationImage;
  String? notificationTitle;
  String? notificationBody;
  String? notificationaLink;
  String? notificationTime;

  NotificationModel(this.id, this.notificationImage, this.notificationTitle,
      this.notificationBody, this.notificationaLink, this.notificationTime);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      'notificationImage': notificationImage ?? "assets/image 37 (1).png",
      'notificationTitle': notificationTitle,
      'notificationBody': notificationBody,
      'notificationaLink': notificationaLink,
      'notificationTime': notificationTime,
    };
    return map;
  }

  NotificationModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    notificationImage = map['notificationImage'];
    notificationTitle = map['notificationTitle'];
    notificationBody = map['notificationBody'];
    notificationaLink = map['notificationaLink'];
    notificationTime = map['notificationTime'];
  }
}