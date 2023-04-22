// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/budget_bloc/budget_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/constants/WidgetStyle.dart';
import 'package:my_journey/models/SpendingEntry.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/ShakeStateWidget.dart';
import 'package:my_journey/widgets/ShakeWidget.dart';
import 'package:uuid/uuid.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}


class _DialogWidgetState extends State<DialogWidget> {
  var _controllerAmountField = TextEditingController();
  bool isAmountFieldError = false;
  final amountFieldErrorShakeKey = GlobalKey<ShakeWidgetState>();

  var _controllerDescriptionField = TextEditingController();
  bool isDescriptionFieldError = false;
  final descriptionFieldErrorShakeKey = GlobalKey<ShakeWidgetState>();

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
        height: 3 * SizeConfig.screenHeight / 8,
        child: SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Add Entry',
                      style: TextStyle(color: ColorPalette.lightPink),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ShakeWidget(
                        key: descriptionFieldErrorShakeKey,
                        shakeCount: 3,
                        shakeOffset: 10,
                        shakeDuration: Duration(milliseconds: 500),
                        child: TextFormField(
                            controller: _controllerDescriptionField,
                            style: TextStyle(
                                color: Color.fromARGB(255, 237, 216, 241)),
                            decoration:
                                WidgetStyle.getInputDecoration('Description'))),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ShakeWidget(
                        key: amountFieldErrorShakeKey,
                        shakeCount: 3,
                        shakeOffset: 10,
                        shakeDuration: Duration(milliseconds: 500),
                        child: TextFormField(
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                            controller: _controllerAmountField,
                            style: TextStyle(
                                color: Color.fromARGB(255, 237, 216, 241)),
                            decoration:
                                WidgetStyle.getInputDecoration('Amount'))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight / 30),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 90,
                            child: TextButton(
                              style: WidgetStyle.getButtonStyle(
                                  ColorPalette.purple),
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
                              style:
                                  WidgetStyle.getButtonStyle(ColorPalette.pink),
                              onPressed: () {
                                setState(() {
                                  isAmountFieldError =
                                      (_controllerAmountField.text.isEmpty);

                                  isDescriptionFieldError =
                                      (_controllerDescriptionField
                                          .text.isEmpty);
                                });
                                if (isAmountFieldError) {
                                  amountFieldErrorShakeKey.currentState
                                      ?.shakeWidget();
                                }
                                if (isDescriptionFieldError) {
                                  descriptionFieldErrorShakeKey.currentState
                                      ?.shakeWidget();
                                }
                                if (!isAmountFieldError &&
                                    !isDescriptionFieldError) {
                                  var id = new Uuid().v4();
                                  var entry = SpendingsEntry(id:id,title: _controllerDescriptionField.text,price: double.parse(_controllerAmountField.text));
                                  context
                                      .read<BudgetBloc>()
                                      .add(AddSpendingsEntry(entry: entry));
                                    Navigator.pop(context);
                                }
                              },
                              child: const Text('Add',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ]),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
