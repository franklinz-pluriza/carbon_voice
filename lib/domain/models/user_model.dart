import 'package:carbon_voice/data/repositories/entities/user_entity.dart';
import 'package:crypt/crypt.dart';
import 'package:uuid/uuid.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String passwordHash;

  User({
    required this.uid,
    required this.username,
    required this.email,
    required this.passwordHash,
  });

  factory User.signUp({
    required String email,
    required String password,
  }) {
    const uuid = Uuid();
    final uid = uuid.v1();
    final username = email.split('@').first;
    return User(
      uid: uid,
      username: username,
      email: email,
      passwordHash: Crypt.sha256(password, salt: uid, rounds: 1000).toString(),
    );
  }

  factory User.fromEntity(UserEntity entity) {
    return User(
      uid: entity.uid,
      username: entity.username,
      email: entity.email,
      passwordHash: entity.passwordHash,
    );
  }

  UserEntity toEntity() {
    return UserEntity()
      ..uid = uid
      ..username = username
      ..email = email
      ..passwordHash = passwordHash;
  }
}
