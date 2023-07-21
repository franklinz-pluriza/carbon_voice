import 'package:carbon_voice/domain/managers/comms_manager.dart';
import 'package:carbon_voice/domain/models/chat_entry_model.dart';
import 'package:carbon_voice/domain/models/contact_model.dart';
import 'package:carbon_voice/domain/models/user_model.dart';
import 'package:get/get.dart';

class CommsController extends GetxController {
  late final CommsManager _commsManager = Get.find();

  late final Rx<List<ChatEntry>> chatHistory = Rx([]);
  late final Rx<List<Contact>> contactList = Rx([]);

  List<ChatEntry> get chats => chatHistory.value;

  List<Contact> get contacts => contactList.value;

  Future<void> init(User user) async {
    await _commsManager.init(user);
  }

  void fetchContacts() {
    contactList.value = _commsManager.getContacts();
  }

  Future<void> fetchChatHistory(User user) async {
    chatHistory.value = _commsManager.getChatHistory(user);
  }

  ChatEntry createChatEntry(User user, Contact contact) {
    return _commsManager.createChatEntry(user, contact);
  }

  void updateChatEntry(ChatEntry entry, User user) {
    _commsManager.updateChatEntry(entry);
    fetchChatHistory(user);
  }


  ChatEntry? getChatByContact(User user, Contact contact) {
    final entry = _commsManager.getChatByContact(user, contact);
    entry?.contact = contact;
    return entry;
  }
}
