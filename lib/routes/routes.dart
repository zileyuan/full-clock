import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:full_clock/routes/route_handlers.dart';
import 'package:full_clock/routes/app_router.dart';

class Routes {
  Routes._();

  static String home = '/';
  static String setting = "/setting";

  static void configureRoutes() {
    final router = Router();
    AppRouter.router = router;

    router.notFoundHandler =
        new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("RΩOUTE WAS NOT FOUND !!!");
      return;
    });

    router.define(home, handler: homeHandler);
    router.define(setting, handler: settingHandler);
  }
}
