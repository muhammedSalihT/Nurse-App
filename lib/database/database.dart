import 'dart:developer';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Future<Database> initDb() async {
    log("sqflite init");
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "notificationDb");
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  static _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE NotificationDetails (id INTEGER PRIMARY KEY, notificationImage TEXT, notificationTitle TEXT,notificationBody TEXT,notificationaLink TEXT,notificationTime TEXT)");
  }
}
