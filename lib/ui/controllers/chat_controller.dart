import 'package:carbon_voice/domain/managers/chat_manager.dart';
import 'package:carbon_voice/domain/models/chat_entry_model.dart';
import 'package:carbon_voice/domain/models/chat_message.dart';
import 'package:carbon_voice/domain/models/contact_model.dart';
import 'package:carbon_voice/domain/models/user_model.dart';
import 'package:carbon_voice/ui/controllers/comms_controller.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  late final ChatManager _chatManager = Get.find();
  late final CommsController _commsController = Get.find();

  late final Rx<Contact?> selectedContact = Rx(null);
  late final Rx<ChatEntry?> selectedChat = Rx(null);
  late final Rx<List<ChatMessage>> messages = Rx([]);

  Contact? get contact => selectedContact.value;
  ChatEntry? get chat => selectedChat.value;
  List<ChatMessage> get chatMessages => messages.value.reversed.toList();

  void selectContact(Contact? contact) {
    selectedContact.value = contact;
  }

  void selectChat(ChatEntry? chat) {
    selectedChat.value = chat;
  }

  void clearMessages() {
    messages.value = [];
  }

  Future<void> getMessages(User user) async {
    if (chat == null) {
      selectedChat.value = _commsController.getChatByContact(user, contact!);
      if (chat != null) {
        messages.value = _chatManager.fetchChatMessages(chat!);
      } else {
        selectedChat.value = _commsController.createChatEntry(user, contact!);
        clearMessages();
      }
    } else {
      messages.value = _chatManager.fetchChatMessages(chat!);
    }
  }

  Future<void> sendMessage(User user, String message) async {
    chat!.message = message;
    _chatManager.saveNewMessage(chat!, user, contact!, chatMessages, message);
    messages.value = _chatManager.fetchChatMessages(chat!);
    _commsController.updateChatEntry(chat!, user);
  }
}
