import 'package:carbon_voice/data/repositories/auth_repository.dart';
import 'package:crypt/crypt.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class AuthManager extends GetxService {
  late final AuthRepository _authRepository = Get.find();

  Future<void> init() async {
    await _authRepository.init();
  }

  User? signIn({required String email, required String password}) {
    final user = _authRepository.getUserByEmail(email);
    if (user == null) {
      throw Exception('User not found');
    }
    if ((Crypt(user.passwordHash).match(password))){
      return user;
    } else {
      return  null;
    }
  }

  User? signUp({required String email, required String password}) {
    if (password.length < 8) return null;
    final user = User.signUp(email: email, password: password);
    _authRepository.saveUser(user);
    return user;
  }
}
