import 'package:flutter/material.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/widgets/Shared/CustomButton.dart';
import 'package:my_journey/widgets/Shared/CustomShakeWidget.dart';
import 'package:my_journey/widgets/Shared/ShakeStateWidget.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'form.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.controller});
  final PageController controller;
  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String? varifyCode;

  final TextEditingController _codeController = TextEditingController();
  bool codeError = false;
  final codeErrorShakeKey = GlobalKey<ShakeWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PurpleColorPalette.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Confirm  Code',
                      style: TextStyle(
                        color: PurpleColorPalette.highLight2,
                        fontSize: 40,
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: 329,
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: PurpleColorPalette.highLight2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: OtpForm(
                          callBack: (code) {
                            varifyCode = code;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        CustomButton(
                            text: "Verify ",
                            width: 120,
                            height: 50,
                            onPressed: (() => {})),
                           CustomButton(
                            text: "Resend ",
                            width: 120,
                            height: 50,
                            onPressed: (() => {})),
                      ],
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: InkWell(
                  onTap: () {
                    widget.controller.animateToPage(2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: const Text(
                    'Back to login screen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
