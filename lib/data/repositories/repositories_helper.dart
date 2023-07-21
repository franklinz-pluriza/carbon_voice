import 'package:get/get.dart';

import 'auth_repository.dart';
import 'chat_repository.dart';

abstract class RepositoriesHelper {
  static void initRepositories() {
    Get.lazyPut(() => AuthRepository(), fenix: true);
    Get.lazyPut(() => ChatRepository(), fenix: true);
  }
}
