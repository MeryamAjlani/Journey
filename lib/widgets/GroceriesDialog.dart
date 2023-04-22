import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_bloc.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_event.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/constants/WidgetStyle.dart';
import 'package:my_journey/models/GroceryEntry.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/ShakeStateWidget.dart';
import 'package:my_journey/widgets/ShakeWidget.dart';
import 'package:uuid/uuid.dart';

class GroceriesDialog extends StatefulWidget {
  const GroceriesDialog({Key? key}) : super(key: key);

  @override
  State<GroceriesDialog> createState() => _GroceriesDialogState();
}

class _GroceriesDialogState extends State<GroceriesDialog> {
  TextEditingController titleController = TextEditingController();
  bool _isTextFieldError = false;
  final _textFieldErrorShakeKey = GlobalKey<ShakeWidgetState>();
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Container(
        decoration: const BoxDecoration(
            color: ColorPalette.background,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ignore: prefer_const_constructors
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Add Grocery Entry',
                      style: TextStyle(color: ColorPalette.lightPink),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ShakeWidget(
                        key: _textFieldErrorShakeKey,
                        shakeCount: 3,
                        shakeOffset: 10,
                        shakeDuration: const Duration(milliseconds: 500),
                        child: TextFormField(
                          controller: titleController,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 237, 216, 241)),
                          decoration: WidgetStyle.getInputDecoration('Title')
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 90,
                          child: TextButton(
                            style: WidgetStyle.getButtonStyle(ColorPalette.purple),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 90,
                          child: TextButton(
                            style: WidgetStyle.getButtonStyle(ColorPalette.pink),
                            onPressed: () {
                            
                              setState(() {
                                _isTextFieldError =
                                    (titleController.text.isEmpty);
                              });
                              if (!_isTextFieldError) {
                                var entry = GroceryEntry(
                                    title: titleController.text,
                                    );
                                context
                                    .read<GroceriesBloc>()
                                    .add(AddGroceryEntry(groceryEntry: entry));
                                Navigator.pop(context);
                                titleController.text = '';
                              } else {
                                _textFieldErrorShakeKey.currentState
                                    ?.shakeWidget();
                              }
                            },
                            child: const Text('Add',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}