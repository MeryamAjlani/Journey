import 'package:flutter/material.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/widgets/Shared/CustomButton.dart';
import 'package:my_journey/widgets/Shared/CustomShakeWidget.dart';
import 'package:my_journey/widgets/Shared/ShakeStateWidget.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key, required this.controller});
  final PageController controller;
  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _repassController = TextEditingController();

  bool emailError = false;
  final emailErrorShakeKey = GlobalKey<ShakeWidgetState>();

  bool passwordError = false;
  final passwordErrorShakeKey = GlobalKey<ShakeWidgetState>();

  bool repassError = false;
  final repassErrorShakeKey = GlobalKey<ShakeWidgetState>();

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
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child:  Center(
                        child: Text(
                          'Create Your Own Adventure !',
                         style: TextStyle(
                          color: PurpleColorPalette.highLight2,
                          fontSize: 25,
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                       padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomInputWidget(controller: _emailController,formKey:emailErrorShakeKey ,title: "Email")
                    ),
                    Padding(
                       padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomInputWidget(controller: _passController,formKey:passwordErrorShakeKey ,title: "Password")
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomInputWidget(controller: _repassController,formKey:repassErrorShakeKey ,title: "Confirm Password")
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(text:"Create Account",width: 500,height: 50,onPressed: (() => {})),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Already have an account?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 2.5,
                        ),
                        InkWell(
                          onTap: () {
                            widget.controller.animateToPage(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: const Text(
                            'Log In ',
                            style: TextStyle(
                              color: PurpleColorPalette.accent,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
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
