import 'package:hive/hive.dart';

part 'chat_message_entity.g.dart';

@HiveType(typeId: 2)
class ChatMessageEntity extends HiveObject{
  @HiveField(0)
  late int index;

  @HiveField(1)
  late String chatId;

  @HiveField(2)
  late String message;

  @HiveField(3)
  late String senderUid;

  @HiveField(4)
  late String receiverUid;

  @HiveField(5)
  late DateTime createdAt;
}