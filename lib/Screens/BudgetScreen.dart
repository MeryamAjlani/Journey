// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/budget_bloc/budget_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/constants/WidgetStyle.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/DialogWidget.dart';
import 'package:my_journey/widgets/EmptyWidget.dart';
import 'dart:math' as math;


class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  List<bool> selected = List<bool>.generate(8, (int index) => false);

  @override
  Widget build(BuildContext context) {
     final spendings = context.watch<BudgetBloc>().state.allSpendings;
    return BlocBuilder<BudgetBloc, BudgetState>(
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => showModalBottomSheet<void>(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0)),
                ),
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return DialogWidget();
                },
              ),
              backgroundColor: ColorPalette.pink,
              child: const Icon(Icons.add),
            ),
            backgroundColor: ColorPalette.background,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                      padding:
                          EdgeInsets.only(top: SizeConfig.screenHeight / 20),
                      child: spendings.isEmpty
                          ? EmptyWidget(
                              imagePath: "assets/images/Pink Paw.png",
                              message: "No spendings added yet !",
                              color: ColorPalette.lightPink)
                          : ListView.separated(
                              shrinkWrap: true,
                              itemCount: spendings.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  highlightColor: ColorPalette.lightPink,
                                  splashColor: ColorPalette.lightPink,
                                  child: Ink(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: SizeConfig.screenWidth / 10,
                                          left: SizeConfig.screenWidth / 10),
                                      child: Dismissible(
                                        key: UniqueKey(),
                                        onDismissed: (direction) {
                                          context.read<BudgetBloc>().add(
                                              DeleteSpendingsEntry(
                                                  entry: spendings[index]));
                                        },
                                        child: Ink(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              left: BorderSide(
                                                  width: 4.0,
                                                  color: ColorPalette.lightGreen),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ListTile(
                                              onTap: () => {
                                                context
                                                    .read<BudgetBloc>()
                                                    .add(UpdateSpendingsEntry(
                                                        entry: spendings[index]))
                                              },
                                              trailing: Transform.rotate(
                                                      angle: -math.pi / 4,
                                                      child: SizedBox(
                                                          height: 30,
                                                          width: 30,
                                                          child: Image.asset(
                                                              'assets/images/Green Paw.png')),
                                                    ),
                                              title: Text(
                                                spendings[index].title,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  indent: SizeConfig.screenWidth / 10,
                                  endIndent: SizeConfig.screenWidth / 10,
                                );
                              },
                            )),
                ],
              ),
            ));
      },
    );
  }
}
