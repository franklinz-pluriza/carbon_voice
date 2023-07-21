import 'package:carbon_voice/data/repositories/chat_repository.dart';
import 'package:carbon_voice/domain/models/chat_entry_model.dart';
import 'package:carbon_voice/domain/models/chat_message.dart';
import 'package:carbon_voice/domain/models/contact_model.dart';
import 'package:carbon_voice/domain/models/user_model.dart';
import 'package:get/get.dart';

class ChatManager extends GetxService {
  late final ChatRepository _chatRepository = Get.find();

  fetchChatMessages(ChatEntry entry) {
    return _chatRepository.getChatMessages(entry);
  }

  saveNewMessage(ChatEntry entry, User user, Contact contact,
      List<ChatMessage> messages, String message) {
    final chatMessage = ChatMessage(
      index: messages.length,
      chatId: entry.id,
      message: message,
      senderUid: user.uid,
      receiverUid: contact.uid,
      createdAt: DateTime.now(),
    );
    _chatRepository.saveChatMessage(chatMessage);
  }
}
