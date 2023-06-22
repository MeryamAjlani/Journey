// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/budget_bloc/budget_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/constants/MonthlyExpenses.dart';
import 'package:my_journey/constants/WidgetStyle.dart';
import 'package:my_journey/models/MonthlySpending.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/Shared/ShakeStateWidget.dart';
import 'package:my_journey/widgets/Shared/ShakeWidget.dart';
import 'package:my_journey/widgets/Shared/SideBar.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

import 'dart:math' as math;

import 'package:uuid/uuid.dart';

class ParamsScreen extends StatefulWidget {
  const ParamsScreen({Key? key}) : super(key: key);

  @override
  State<ParamsScreen> createState() => _ParamsScreenState();
}

class _ParamsScreenState extends State<ParamsScreen> {
  var _controllerAmountField = TextEditingController();
  bool isAmountFieldError = false;
  final amountFieldErrorShakeKey = GlobalKey<ShakeWidgetState>();

  var _controllerDescriptionField = TextEditingController();
  bool isDescriptionFieldError = false;
  final descriptionFieldErrorShakeKey = GlobalKey<ShakeWidgetState>();
  bool isIconFieldError = false;
  final iconFieldErrorShakeKey = GlobalKey<ShakeWidgetState>();
  IconData? _icon;

  _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        backgroundColor: ColorPalette.background,
        iconColor: ColorPalette.lightPink,
        title: Text(
          "Pick an icon",
          style: TextStyle(color: ColorPalette.lightPink),
        ),
        closeChild: Text(
          'Close',
          style: TextStyle(color: ColorPalette.lightPink),
        ),
        iconPackModes: [IconPack.cupertino]);

    setState(() {
      _icon = icon;
    });
  }

  TextEditingController priceController = TextEditingController();

  TextEditingController initialBudgetController = TextEditingController();
  bool initialBudgetFieldError = false;
  final initialBudgetFieldErrorShakeKey = GlobalKey<ShakeWidgetState>();

  @override
  Widget build(BuildContext context) {
    List<MonthlySpendingEntry>? monthlySpendingsList =
        context.watch<BudgetBloc>().state.monthlyFixedSpendings;
    print(monthlySpendingsList.length);
    return BlocBuilder<BudgetBloc, BudgetState>(
      builder: (context, state) {
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color.fromARGB(255, 40, 7, 63),
          ),
          backgroundColor: ColorPalette.background,
          body: SafeArea(
              child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth / 15),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(children: [
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ShakeWidget(
                      key: initialBudgetFieldErrorShakeKey,
                      shakeCount: 3,
                      shakeOffset: 10,
                      shakeDuration: const Duration(milliseconds: 500),
                      child: TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          controller: initialBudgetController,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 237, 216, 241)),
                          decoration:
                              WidgetStyle.getInputDecoration('Initial Budget')),
                    )),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 25, 4, 40)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: Column(children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth / 10, bottom: 20),
                          child: Text(
                            'Add monthly expense :',
                            style: TextStyle(
                                color: ColorPalette.lightPink,
                                fontSize: 20,
                                fontFamily: 'Pacifico'),
                          ),
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
                                decoration: WidgetStyle.getInputDecoration(
                                    'Description',
                                    icon: _icon))),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ShakeWidget(
                            key: amountFieldErrorShakeKey,
                            shakeCount: 3,
                            shakeOffset: 10,
                            shakeDuration: Duration(milliseconds: 500),
                            child: TextFormField(
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                controller: _controllerAmountField,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 237, 216, 241)),
                                decoration:
                                    WidgetStyle.getInputDecoration('Amount'))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 120,
                              child: ShakeWidget(
                                key: iconFieldErrorShakeKey,
                                shakeCount: 3,
                                shakeOffset: 10,
                                shakeDuration: Duration(milliseconds: 500),
                                child: ElevatedButton(
                                  style: WidgetStyle.getButtonStyle(
                                      ColorPalette.pink),
                                  onPressed: _pickIcon,
                                  child: const Text(
                                    'IconPicker',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 120,
                              child: ElevatedButton(
                                style: WidgetStyle.getButtonStyle(
                                    ColorPalette.pink),
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
                                  if (_icon == null) {
                                    iconFieldErrorShakeKey.currentState
                                        ?.shakeWidget();
                                  }
                                  if (isDescriptionFieldError) {
                                    descriptionFieldErrorShakeKey.currentState
                                        ?.shakeWidget();
                                  }
                                  if (!isAmountFieldError &&
                                      !isDescriptionFieldError &&
                                      _icon != null) {
                                    var id = Uuid().v4();
                                    var entry = MonthlySpendingEntry(
                                        id: id,
                                        title: _controllerDescriptionField.text,
                                        price: double.parse(
                                            _controllerAmountField.text),
                                        icon: _icon);
                                    print(monthlySpendingsList);
                                    context.read<BudgetBloc>().add(
                                        AddMonthlySpendingsEntry(entry: entry));
                                  }
                                },
                                child: const Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: monthlySpendingsList.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          context.read<BudgetBloc>().add(
                              DeleteMonthlySpendingsEntry(
                                  entry: monthlySpendingsList[index]));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            //borderRadius: BorderRadius.circular(20),
                            border: Border(
                              left: BorderSide(
                                  width: 4.0, color: ColorPalette.lightGreen),
                            ),
                          ),
                          child: ListTile(
                            trailing: Icon(_icon,color: ColorPalette.lightGreen,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            tileColor: Color.fromARGB(255, 25, 4, 40),
                            title: Text(
                              monthlySpendingsList[index].title,
                              style: const TextStyle(color: Colors.white),
                              textAlign: TextAlign.left,
                            ),
                            subtitle: Text(
                              monthlySpendingsList[index].price.toString(),
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      );
                    })
              ]),
            ),
          )),
        );
      },
    );
  }
}
