import 'package:hive/hive.dart';

part 'chat_entry_entity.g.dart';

@HiveType(typeId: 1)
class ChatEntryEntity extends HiveObject{
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String memberA;

  @HiveField(2)
  late String memberB;

  @HiveField(3)
  late String message;
}