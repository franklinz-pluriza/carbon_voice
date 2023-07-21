import 'package:carbon_voice/domain/managers/auth_manager.dart';
import 'package:carbon_voice/domain/models/user_model.dart';
import 'package:carbon_voice/ui/enums/app_routes.dart';
import 'package:carbon_voice/ui/routes/routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late final AuthManager _manager = Get.find();

  late final RxInt _screenIndex = RxInt(0);
  late final Rx<User?> _currentUser = Rx<User?>(null);

  bool get isSignInScreen => _screenIndex.value == 0;

  User? get currentUser => _currentUser.value;

  void toggleScreen() {
    _screenIndex.value = (_screenIndex.value + 1) % 2;
  }

  Future<void> init() async {
    await _manager.init();
  }

  signIn({required String email, required String password}) async {
    try {
      final user = _manager.signIn(email: email, password: password);
      if (user != null) {
        _currentUser.value = user;
        AppRouter.ofAll(AppRoute.content);
      } else {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Error',
            message: 'Email or password is incorrect.',
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Error',
          message: 'Account could not be found.',
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  signUp({required String email, required String password}) async {
    final user = _manager.signUp(email: email, password: password);
    if (user != null) {
      _currentUser.value = user;
      toggleScreen();
      AppRouter.ofAll(AppRoute.content);
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'Error',
          message: 'Account could not be created, the password is too short.',
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  signOut() async {
    _currentUser.value = null;
    AppRouter.ofAll(AppRoute.authentication);
  }
}
