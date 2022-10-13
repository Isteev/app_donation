// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as int?,
      documentNumber: fields[1] as String,
      firstName: fields[2] as String,
      lastName: fields[3] as String,
      localityId: fields[5] as String,
      email: fields[4] as String?,
      cityId: fields[6] as String,
      countryId: fields[7] as String,
      documentTypeId: fields[8] as String,
      oauthId: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.documentNumber)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.localityId)
      ..writeByte(6)
      ..write(obj.cityId)
      ..writeByte(7)
      ..write(obj.countryId)
      ..writeByte(8)
      ..write(obj.documentTypeId)
      ..writeByte(9)
      ..write(obj.oauthId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
