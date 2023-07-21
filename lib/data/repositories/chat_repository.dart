import 'package:carbon_voice/domain/models/chat_entry_model.dart';
import 'package:carbon_voice/domain/models/chat_message.dart';
import 'package:carbon_voice/domain/models/contact_model.dart';
import 'package:carbon_voice/domain/models/user_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'entities/chat_entry_entity.dart';
import 'entities/chat_message_entity.dart';

class ChatRepository extends GetxService {
  late Box<ChatEntryEntity?> _historyBox;
  late Box<ChatMessageEntity> _messagesBox;

  Future<void> init() async {
    Hive.registerAdapter(ChatEntryEntityAdapter());
    Hive.registerAdapter(ChatMessageEntityAdapter());
    _historyBox = await Hive.openBox('history');
    _messagesBox = await Hive.openBox('messages');
  }

  void saveChatEntry(ChatEntry chatEntry) {
    _historyBox.add(chatEntry.toEntity());
  }

  void updateChatEntry(ChatEntry chatEntry) {
    _historyBox.put(chatEntry.id, chatEntry.toEntity());
  }

  List<ChatEntry> getChatHistory(User user) {
    return _historyBox.values
        .where(
            (entry) => entry!.memberA == user.uid || entry.memberB == user.uid)
        .map((entry) => ChatEntry.fromEntity(entry!))
        .where((entry) => entry.message.isNotEmpty)
        .toList();
  }

  ChatEntry? getChatByContact(User user, Contact contact) {
    final entry = _historyBox.values.firstWhere(
        (entry) =>
            (entry!.memberA == contact.uid && entry.memberB == user.uid) ||
            (entry.memberA == user.uid && entry.memberB == contact.uid),
        orElse: () => null);
    return entry != null ? ChatEntry.fromEntity(entry) : null;
  }

  void saveChatMessage(ChatMessage message) {
    _messagesBox.add(message.toEntity());
  }

  List<ChatMessage> getChatMessages(ChatEntry entry) {
    return _messagesBox.values
        .where((message) => message.chatId == entry.id)
        .map((message) => ChatMessage.fromEntity(message))
        .toList();
  }
}
