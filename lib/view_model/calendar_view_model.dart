import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_una/model/calendar_events_model_hive.dart';

class ClanderViewModel with ChangeNotifier {
  static ValueNotifier<List<CalnderModel>> checkstudent = ValueNotifier([]);

  static void addEvant(CalnderModel check) async {
    final stude = await Hive.openBox<CalnderModel>("Calnder");
    final id = await stude.add(check);
    check.id = id;
    checkstudent.value.add(check);
    checkstudent.notifyListeners();
  }

  static void getallEvant() async {
    final stude = await Hive.openBox<CalnderModel>("Calnder");
    checkstudent.value.clear();
    checkstudent.value.addAll(stude.values);
    checkstudent.notifyListeners();
  }

  static void delete(int id) async {
    final stude = await Hive.openBox<CalnderModel>("Calnder");
    await stude.delete(id);
    getallEvant();
  }

  static void update(int id, check) async {
    final stude = await Hive.openBox<CalnderModel>("Calnder");
    stude.put(id, check);
    getallEvant();
  }

  static void deleteall() async {
    final stude = await Hive.openBox<CalnderModel>("Calnder");
    stude.clear();
    getallEvant();
  }
}
