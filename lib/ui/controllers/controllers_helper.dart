import 'package:get/get.dart';

import 'auth_controller.dart';
import 'chat_controller.dart';
import 'comms_controller.dart';

abstract class ControllersHelper {
  static void initControllers() {
    Get.put(AuthController());
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => CommsController(), fenix: true);
  }
}
