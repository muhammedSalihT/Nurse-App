import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:project_una/database/database.dart';
import 'package:project_una/model/notification_model.dart';
import 'package:sqflite/sqflite.dart';

class NotificationProvider extends ChangeNotifier {
  List<NotificationModel> notificationList = [];
  Future<void> saveNotification(NotificationModel notificationModel) async {
    final db = await DatabaseHelper.initDb();
    await db.insert("NotificationDetails", notificationModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> getNotificationList() async {
    notificationList.clear();
    final db = await DatabaseHelper.initDb();
    final List<Map<String, dynamic>> map =
        await db.query("NotificationDetails");
    if (map.length > 0) {
      for (int i = 0; i < map.length; i++) {
        notificationList.add(NotificationModel.fromMap(map[i]));
        notifyListeners();
      }
    }
    log(notificationList.toString());
  }
}
