import 'package:carbon_voice/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'enums/app_routes.dart';
import 'helpers/route_names.dart';

class CarbonVoiceApp extends StatefulWidget {
  const CarbonVoiceApp({super.key});

  @override
  State<CarbonVoiceApp> createState() => _State();
}

class _State extends State<CarbonVoiceApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carbon Voice',
      initialRoute: RouteNames.getRoute(AppRoute.splashScreen),
      getPages: AppRouter.pages,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xff5343c2),
          secondary: Color(0xff5343c2),
          onSecondary: Colors.white,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
