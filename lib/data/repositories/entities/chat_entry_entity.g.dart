// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_entry_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatEntryEntityAdapter extends TypeAdapter<ChatEntryEntity> {
  @override
  final int typeId = 1;

  @override
  ChatEntryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatEntryEntity()
      ..id = fields[0] as String
      ..memberA = fields[1] as String
      ..memberB = fields[2] as String
      ..message = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, ChatEntryEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.memberA)
      ..writeByte(2)
      ..write(obj.memberB)
      ..writeByte(3)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatEntryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
