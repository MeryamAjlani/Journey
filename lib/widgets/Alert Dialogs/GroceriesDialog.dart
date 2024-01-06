import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_bloc.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_event.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/constants/WidgetStyle.dart';
import 'package:my_journey/models/GroceryEntry.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/Shared/CustomShakeWidget.dart';
import 'package:my_journey/widgets/Shared/ShakeStateWidget.dart';
import 'package:my_journey/widgets/Shared/ShakeWidget.dart';
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
            color: PurpleColorPalette.background,
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
                      style: TextStyle(color: PurpleColorPalette.highLight2),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: CustomInputWidget(
                          formKey: _textFieldErrorShakeKey,
                          title: 'Title',
                          controller: titleController)),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight / 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: TextButton(
                            style: WidgetStyle.getButtonStyle(
                                PurpleColorPalette.secondaryColor),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: TextButton(
                            style: WidgetStyle.getButtonStyle(
                                PurpleColorPalette.accent),
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
