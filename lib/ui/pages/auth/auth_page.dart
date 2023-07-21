import 'package:carbon_voice/ui/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'widgets/auth_form.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: SvgPicture.asset(
                  'assets/svg/carbon_voice_logo.svg',
                  width: MediaQuery.of(context).size.width * 0.66,
                ),
              ),
              const AuthForm(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                onPressed: () => controller.toggleScreen(),
                child: Obx(
                  () => Text(!controller.isSignInScreen ? 'Sign In' : 'Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
