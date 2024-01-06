import 'package:flutter/material.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/widgets/Shared/ShakeStateWidget.dart';
import '../../widgets/Shared/CustomButton.dart';
import '../../widgets/Shared/CustomShakeWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.controller});
  final PageController controller;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  bool emailError = false;
  final emailErrorShakeKey = GlobalKey<ShakeWidgetState>();

  bool passwordError = false;
  final passwordErrorShakeKey = GlobalKey<ShakeWidgetState>();

  bool isTextVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PurpleColorPalette.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  textDirection: TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back !',
                      style: TextStyle(
                        color: PurpleColorPalette.highLight2,
                        fontSize: 40,
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomInputWidget(
                        formKey: emailErrorShakeKey,
                        title: 'Email',
                        controller: _emailController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomInputWidget(
                        formKey: passwordErrorShakeKey,
                        title: 'Password',
                        controller: _passController,
                        isTextVisible: isTextVisible,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: CustomButton(
                          text: "Sign In",
                          width: 230,
                          height: 50,
                          onPressed: (() => {})),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 2.5,
                        ),
                        InkWell(
                          onTap: () {
                            widget.controller.animateToPage(1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: PurpleColorPalette.accent,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: PurpleColorPalette.accent,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 void logInFunction(String ){

}