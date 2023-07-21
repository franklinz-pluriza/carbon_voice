import 'package:carbon_voice/ui/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
* This is a simple implementation where the registration form and the login form share the same form, so we only update some text and the button action.
* Normally we would have two different forms, but for the sake of simplicity we will use the same one.
*/
class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _State();
}

class _State extends State<AuthForm> {
  late final AuthController controller;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late bool isPasswordVisible;

  get color => Theme.of(context).colorScheme.primary;

  @override
  void initState() {
    super.initState();
    controller = Get.find();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(
          () => Text(
            controller.isSignInScreen
                ? 'Enter your credentials'
                : 'Create an account',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: color,
            decoration: InputDecoration(
              labelText: 'Email',
              floatingLabelStyle: TextStyle(
                color: color,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: color,
                ),
              ),
              focusColor: color,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 20.0),
          child: TextField(
            controller: passwordController,
            obscureText: !isPasswordVisible,
            cursorColor: color,
            decoration: InputDecoration(
              labelText: 'Password',
              floatingLabelStyle: TextStyle(
                color: color,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: color,
                ),
              ),
              focusColor: color,
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFFC6B9BD),
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
            ),
          ),
        ),
        Obx(
          () => ElevatedButton(
            onPressed: () => controller.isSignInScreen
                ? controller.signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  )
                : controller.signUp(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
            child: Text(controller.isSignInScreen ? 'Sign In' : 'Sign Up'),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
