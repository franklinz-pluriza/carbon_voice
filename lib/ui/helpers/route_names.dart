import 'package:carbon_voice/ui/enums/app_routes.dart';

abstract class RouteNames {
  static get _splashScreen => "/";

  static get _authentication => "/auth";

  static get _content => "/content";

  static get _contacts => "/contacts";

  static get _chat => "/chat";

  // Makes getting the asset path more declarative
  static String getRoute(AppRoute route) {
    switch (route) {
      case AppRoute.splashScreen:
        return _splashScreen;
      case AppRoute.authentication:
        return _authentication;
      case AppRoute.content:
        return _content;
      case AppRoute.contacts:
        return _contacts;
      case AppRoute.chat:
        return _chat;
    }
  }
}
