// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalModelAdapter extends TypeAdapter<LocalModel> {
  @override
  final int typeId = 1;

  @override
  LocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalModel(
      serverPath: fields[0] as String?,
      imagePath: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.serverPath)
      ..writeByte(1)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
