// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatMessageEntityAdapter extends TypeAdapter<ChatMessageEntity> {
  @override
  final int typeId = 2;

  @override
  ChatMessageEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatMessageEntity()
      ..index = fields[0] as int
      ..chatId = fields[1] as String
      ..message = fields[2] as String
      ..senderUid = fields[3] as String
      ..receiverUid = fields[4] as String
      ..createdAt = fields[5] as DateTime;
  }

  @override
  void write(BinaryWriter writer, ChatMessageEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.chatId)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.senderUid)
      ..writeByte(4)
      ..write(obj.receiverUid)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessageEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
