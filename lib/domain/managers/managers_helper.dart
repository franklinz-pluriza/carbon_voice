import 'package:carbon_voice/domain/managers/chat_manager.dart';
import 'package:get/get.dart';

import 'auth_manager.dart';
import 'comms_manager.dart';

abstract class ManagersHelper {
  static void initManagers() {
    Get.lazyPut(() => AuthManager());
    Get.lazyPut(() => ChatManager());
    Get.lazyPut(() => CommsManager());
  }
}
