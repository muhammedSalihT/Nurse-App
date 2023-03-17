// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_events_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalnderModelAdapter extends TypeAdapter<CalnderModel> {
  @override
  final int typeId = 1;

  @override
  CalnderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalnderModel(
      name: fields[1] as String,
      date: fields[2] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CalnderModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalnderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
