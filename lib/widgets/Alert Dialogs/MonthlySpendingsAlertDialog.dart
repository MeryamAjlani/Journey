import 'package:flutter/material.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/constants/MonthlyExpenses.dart';
import 'package:my_journey/constants/WidgetStyle.dart';
import 'package:my_journey/screensize/ScreenSize.dart';

import 'dart:math' as math;

class MonthlySpendingsAlertDialog extends StatefulWidget {
  const MonthlySpendingsAlertDialog({super.key});

  @override
  State<MonthlySpendingsAlertDialog> createState() =>
      _MonthlySpendingsAlertDialogState();
}

class _MonthlySpendingsAlertDialogState
    extends State<MonthlySpendingsAlertDialog> {
  final choiceList = MonthlyExpense.choiceList;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Container(
        decoration: const BoxDecoration(
            color: ColorPalette.background,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        height: 650,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                 const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child:  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Add Monthly Spendings',
                        style: TextStyle(color: ColorPalette.lightPink,fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: choiceList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: 20,
                                right: SizeConfig.screenWidth / 20,
                                left: SizeConfig.screenWidth / 20),
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(165, 245, 213, 224)),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                onTap: () => {
                                  setState(
                                    () => {
                                      choiceList[index].isSelected =
                                          !choiceList[index].isSelected!
                                    },
                                  )
                                },
                                leading: Icon(
                                  choiceList[index].icon,
                                  color: ColorPalette.lightGreen,
                                ),
                                trailing: choiceList[index].isSelected!
                                    ? Transform.rotate(
                                        angle: -math.pi / 4,
                                        child: SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(
                                                'assets/images/Green Paw.png')),
                                      )
                                    : null,
                                title: Text(
                                  choiceList[index].title,
                                  style: const TextStyle(color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SizedBox(
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
                          ),
                          SizedBox(
                            height: 40,
                            width: 90,
                            child: TextButton(
                              style:
                                  WidgetStyle.getButtonStyle(ColorPalette.pink),
                              onPressed: () {},
                              child: const Text('Add',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
