import 'package:carbon_voice/domain/models/user_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'entities/user_entity.dart';

class AuthRepository extends GetxService {
  late Box<UserEntity?> _usersBox;

  Future<void> init() async {
    Hive.registerAdapter(UserEntityAdapter());
    _usersBox = await Hive.openBox('users');
  }

  void saveUser(User user) {
    _usersBox.add(user.toEntity());
  }

  User? getUserByUid(String uid) {
    final UserEntity? user = _usersBox.values
        .firstWhere((user) => user!.uid == uid, orElse: () => null);
    return user != null ? User.fromEntity(user) : null;
  }

  User? getUserByEmail(String email) {
    final UserEntity? user = _usersBox.values
        .firstWhere((user) => user!.email == email, orElse: () => null);
    return user != null ? User.fromEntity(user) : null;
  }

  List<User> getUsers() {
    return _usersBox.values.map((user) => User.fromEntity(user!)).toList();
  }
}
