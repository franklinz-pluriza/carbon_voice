import 'package:carbon_voice/data/repositories/entities/chat_entry_entity.dart';
import 'package:carbon_voice/domain/models/contact_model.dart';

class ChatEntry {
  final String id;
  final String memberA;
  final String memberB;
  String message;
  Contact? contact;

  ChatEntry({
    required this.id,
    required this.memberA,
    required this.memberB,
    required this.message,
  });

  factory ChatEntry.fromEntity(ChatEntryEntity entity) {
    return ChatEntry(
      id: entity.id,
      memberA: entity.memberA,
      memberB: entity.memberB,
      message: entity.message,
    );
  }

  ChatEntryEntity toEntity() {
    return ChatEntryEntity()
      ..id = id
      ..memberA = memberA
      ..memberB = memberB
      ..message = message;
  }
}
