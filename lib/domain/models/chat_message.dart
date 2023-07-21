import 'package:carbon_voice/data/repositories/entities/chat_message_entity.dart';

class ChatMessage {
  final int index;
  final String chatId;
  final String message;
  final String senderUid;
  final String receiverUid;
  final DateTime createdAt;

  ChatMessage({
    required this.index,
    required this.chatId,
    required this.message,
    required this.senderUid,
    required this.receiverUid,
    required this.createdAt,
  });

  factory ChatMessage.fromEntity(ChatMessageEntity entity) {
    return ChatMessage(
      index: entity.index,
      chatId: entity.chatId,
      message: entity.message,
      senderUid: entity.senderUid,
      receiverUid: entity.receiverUid,
      createdAt: entity.createdAt,
    );
  }

  ChatMessageEntity toEntity() {
    return ChatMessageEntity()
      ..index = index
      ..chatId = chatId
      ..message = message
      ..senderUid = senderUid
      ..receiverUid = receiverUid
      ..createdAt = createdAt;
  }
}
