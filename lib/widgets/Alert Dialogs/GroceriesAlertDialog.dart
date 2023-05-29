import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/budget_bloc/budget_bloc.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_bloc.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_event.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/constants/WidgetStyle.dart';
import 'package:my_journey/models/SpendingEntry.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/Shared/ShakeStateWidget.dart';
import 'package:my_journey/widgets/Shared/ShakeWidget.dart';
import 'package:uuid/uuid.dart';

class GroceriesAlertDialog extends StatefulWidget {
  const GroceriesAlertDialog({Key? key}) : super(key: key);

  @override
  State<GroceriesAlertDialog> createState() => _GroceriesAlertDialogState();
}

class _GroceriesAlertDialogState extends State<GroceriesAlertDialog> {
  TextEditingController titleController = TextEditingController();
  bool _isPriceFieldError = false;
  final _priceFieldErrorShakeKey = GlobalKey<ShakeWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Container(
        decoration: const BoxDecoration(color: ColorPalette.background,
        borderRadius:BorderRadius.all(Radius.circular(10.0)) ),
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ShakeWidget(
                    key: _priceFieldErrorShakeKey,
                    shakeCount: 3,
                    shakeOffset: 10,
                    shakeDuration: const Duration(milliseconds: 500),
                    child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        controller: titleController,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 237, 216, 241)),
                        decoration: WidgetStyle.getInputDecoration('Amount')),
                  )
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
                            _isPriceFieldError = (titleController.text.isEmpty);
                          });
                          if (!_isPriceFieldError) {
                            var id = const Uuid().v4();
                            var entry = SpendingsEntry(
                                id: id,
                                title: 'Groceries',
                                price: double.parse(titleController.text));
                            context
                                .read<BudgetBloc>()
                                .add(AddSpendingsEntry(entry: entry));
                            Navigator.pop(context);

                            context
                                .read<GroceriesBloc>()
                                .add(ClearCompleted( ));

                            titleController.text = '';
                          } else {
                            _priceFieldErrorShakeKey.currentState
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
    );
  }
}
