// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/budget_bloc/budget_bloc.dart';
import 'package:my_journey/Blocs/monthly_spendings/monthly_spendings_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/models/MonthlySpending.dart';
import 'package:my_journey/models/SpendingEntry.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'dart:math' as math;

class MonthlyBudgetScreen extends StatefulWidget {
  const MonthlyBudgetScreen({Key? key}) : super(key: key);

  @override
  State<MonthlyBudgetScreen> createState() => _MonthlyBudgetScreenState();
}

class _MonthlyBudgetScreenState extends State<MonthlyBudgetScreen> {
  @override
  Widget build(BuildContext context) {
    final monthlySpendings =
        context.watch<MonthlySpendingsBloc>().state.monthlyFixedSpendings;
    final moneyLeft = context.watch<MonthlySpendingsBloc>().state.budgetLeft;
    final initialBidget = context.watch<MonthlySpendingsBloc>().state.initialBudget;
    final percentage = moneyLeft / initialBidget;
    return BlocBuilder<MonthlySpendingsBloc, MonthlySpendingsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorPalette.background,
          body: Column(
            children: [
              Container(
                height: SizeConfig.screenHeight / 4,
                decoration: BoxDecoration(
                  color: ColorPalette.background,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.screenHeight / 15, bottom: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ' $moneyLeft euros left',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          )),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: LinearPercentIndicator(
                        barRadius: const Radius.circular(16),
                        lineHeight: 15.0,
                        animationDuration: 200,
                        percent: percentage,
                        backgroundColor: Color.fromARGB(255, 25, 4, 40),
                        progressColor: ColorPalette.pink,
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 25, 4, 40),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth / 15,
                        vertical: SizeConfig.screenHeight / 20),
                    child: Wrap(children: [
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: monthlySpendings!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 70,
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
                                  subtitle: monthlySpendings[index].isPaid!
                                      ? Text(
                                          "paid on : ${monthlySpendings[index].date}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  159, 255, 255, 255)),
                                        )
                                      : null,
                                  onTap: () => {
                                    context.read<MonthlySpendingsBloc>().add(
                                        UpdateMonthlySpendingsEntry(
                                            entry: monthlySpendings[index]))
                                  },
                                  leading: Icon(
                                    monthlySpendings[index].icon,
                                    color: ColorPalette.lightGreen,
                                    size: 25,
                                  ),
                                  trailing: monthlySpendings[index].isPaid!
                                      ? Transform.rotate(
                                          angle: -math.pi / 4,
                                          child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: Image.asset(
                                                  'assets/images/Green Paw.png')),
                                        )
                                      : null,
                                  title: Row(
                                    children: [
                                      Text(
                                        monthlySpendings[index].title,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        textAlign: TextAlign.left,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: SizeConfig.screenWidth / 4),
                                        child: Text(
                                            '${monthlySpendings[index].price} €',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Center(
                            child: Divider(
                              indent: SizeConfig.screenWidth / 10,
                              endIndent: SizeConfig.screenWidth / 10,
                            ),
                          );
                        },
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
