import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
  late String uid;

  @HiveField(1)
  late String username;

  @HiveField(2)
  late String email;

  @HiveField(3)
  late String passwordHash;
}