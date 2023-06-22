// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/budget_bloc/budget_bloc.dart';
import 'package:my_journey/Blocs/monthly_spendings/monthly_spendings_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/models/MonthlySpending.dart';
import 'package:my_journey/models/SpendingEntry.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/Shared/CustomListTile.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class MonthlyBudgetScreen extends StatefulWidget {
  const MonthlyBudgetScreen({Key? key}) : super(key: key);

  @override
  State<MonthlyBudgetScreen> createState() => _MonthlyBudgetScreenState();
}

class _MonthlyBudgetScreenState extends State<MonthlyBudgetScreen> {
  @override
  Widget build(BuildContext context) {
    final monthlySpendings =
        context.watch<BudgetBloc>().state.monthlyFixedSpendings;
    final moneyLeft = context.watch<BudgetBloc>().state.budgetLeft;
    final initialBidget =
        context.watch<BudgetBloc>().state.initialBudget;
    final percentage = moneyLeft / initialBidget;
    return BlocBuilder<BudgetBloc, BudgetState>(
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
                            ' $moneyLeft € left',
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
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: monthlySpendings.length,
                        itemBuilder: (context, index) {
                          return CustomListTile(title: monthlySpendings[index].title,date:  monthlySpendings[index].date,icon:  monthlySpendings[index].icon,status:  monthlySpendings[index].isPaid,);
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

