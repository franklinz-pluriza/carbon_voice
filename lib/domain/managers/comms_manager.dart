import 'package:carbon_voice/data/repositories/auth_repository.dart';
import 'package:carbon_voice/data/repositories/chat_repository.dart';
import 'package:carbon_voice/domain/models/chat_entry_model.dart';
import 'package:carbon_voice/domain/models/user_model.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/contact_model.dart';

class CommsManager extends GetxService {
  late final AuthRepository _authRepository = Get.find();
  late final ChatRepository _chatRepository = Get.find();

  Future<void> init(User user) async {
    // Note: At this point, the AuthRepository is already initialized, so we don't need to call it again.
    await _chatRepository.init();
  }

  ChatEntry createChatEntry(User user, Contact contact) {
    const uuid = Uuid();
    final chatEntry = ChatEntry(
      id: uuid.v1(),
      memberA: user.uid,
      memberB: contact.uid,
      message: '',
    );
    chatEntry.contact = contact;
    _chatRepository.saveChatEntry(chatEntry);
    return chatEntry;
  }

  void updateChatEntry(ChatEntry entry) {
    _chatRepository.updateChatEntry(entry);
  }

  List<ChatEntry> getChatHistory(User user) {
    final entries = _chatRepository.getChatHistory(user);
    // Note: We need to fetch the contact info (the other user's info) for each chat entry.
    for (final entry in entries) {
      final contactUid =
          entry.memberA == user.uid ? entry.memberB : entry.memberA;
      final contactUser = _authRepository.getUserByUid(contactUid);
      entry.contact = Contact.fromUser(contactUser!);
    }
    return entries;
  }

  ChatEntry? getChatByContact(User user, Contact contact) {
    final entry = _chatRepository.getChatByContact(user, contact);
    entry?.contact = contact;
    return entry;
  }

  List<Contact> getContacts() {
    final users = _authRepository.getUsers();
    return users.map((user) => Contact.fromUser(user)).toList();
  }
}
