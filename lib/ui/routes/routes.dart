import 'package:carbon_voice/ui/enums/app_routes.dart';
import 'package:carbon_voice/ui/helpers/route_names.dart';
import 'package:carbon_voice/ui/pages/chat/chat_page.dart';
import 'package:carbon_voice/ui/pages/contacts/contacts_page.dart';
import 'package:get/route_manager.dart';

import '../pages/auth/auth_page.dart';
import '../pages/content/content_page.dart';
import '../pages/splash/splash.page.dart';

// Just a helper class to make the app routing of the application easier to understand.
abstract class AppRouter {
  static get pages => [
        GetPage(
          name: RouteNames.getRoute(AppRoute.splashScreen),
          page: () => const SplashScreenPage(),
        ),
        GetPage(
          name: RouteNames.getRoute(AppRoute.authentication),
          page: () => const AuthPage(),
        ),
        GetPage(
          name: RouteNames.getRoute(AppRoute.content),
          page: () => const ContentPage(),
        ),
        GetPage(
          name: RouteNames.getRoute(AppRoute.contacts),
          page: () => const ContactsPage(),
        ),
        GetPage(
          name: RouteNames.getRoute(AppRoute.chat),
          page: () => const ChatPage(),
        )
      ];

  static Future<void> to(AppRoute route) async {
    await Get.toNamed(RouteNames.getRoute(route));
  }

  static Future<void> off(AppRoute route) async {
    await Get.offNamed(RouteNames.getRoute(route));
  }

  static Future<void> ofAll(AppRoute route) async {
    await Get.offAllNamed(RouteNames.getRoute(route));
  }

  static void back() {
    Get.back();
  }
}
