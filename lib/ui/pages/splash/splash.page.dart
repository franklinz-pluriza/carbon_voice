import 'package:carbon_voice/ui/controllers/auth_controller.dart';
import 'package:carbon_voice/ui/enums/app_routes.dart';
import 'package:carbon_voice/ui/routes/routes.dart';
import 'package:carbon_voice/ui/widgets/lottie_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<SplashScreenPage> {
  late final AuthController controller;
  late bool animationFinished;
  late bool initFinished;

  @override
  void initState() {
    controller = Get.find();
    animationFinished = false;
    initFinished = false;
    controller.init().then((_) {
      initFinished = true;
      if (animationFinished) {
        AppRouter.ofAll(
          AppRoute.authentication,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5343c2),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff5343c2),
                  Color(0xff4232B4),
                ],
              ),
            ),
          ),
          Center(
            child: LottieAnimation(
              asset: 'assets/lottie/carbon_voice.json',
              duration: const Duration(seconds: 3),
              width: MediaQuery.of(context).size.width * 0.8,
              whenComplete: () {
                animationFinished = true;
                if (initFinished) {
                  AppRouter.ofAll(
                    AppRoute.authentication,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
