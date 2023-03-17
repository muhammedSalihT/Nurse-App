import 'package:hive_flutter/hive_flutter.dart';
part 'calendar_events_model_hive.g.dart';

@HiveType(typeId: 1)
class CalnderModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String date;
  CalnderModel({required this.name, required this.date, this.id});
}
