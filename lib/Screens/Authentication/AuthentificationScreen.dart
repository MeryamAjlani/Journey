import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import 'SignupScreen.dart';
import 'VerificationScreen.dart';

class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({super.key});

  @override
  State<AuthentificationScreen> createState() => _AuthentificationScreenState();
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        controller: controller,
        itemBuilder: (context, index) {
          if (index == 0) {
            return LoginScreen(
              controller: controller,
            );
          } else if (index == 1) {
            return SingUpScreen(
              controller: controller,
            );
          } else {
               return VerificationScreen(
              controller: controller,
            );
          }
        },
      ),
    );
  }
}