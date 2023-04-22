// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/budget_bloc/budget_bloc.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:intl/intl.dart';
import 'package:my_journey/widgets/Alert%20Dialogs/DialogWidget.dart';
import 'package:my_journey/widgets/Shared/EmptyWidget.dart';


class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {


  @override
  Widget build(BuildContext context) {
    String date = DateFormat.yMMMEd().format(DateTime.now());

    final spendings = context.watch<BudgetBloc>().state.allSpendings;
    final total = context.watch<BudgetBloc>().state.total;
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
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight / 20),
                    child: spendings.isEmpty
                        ? EmptyWidget(
                            imagePath: "assets/images/Pink Paw.png",
                            message: "No spendings added yet !",
                            color: ColorPalette.lightPink)
                        : Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: SizeConfig.screenHeight / 20,left: SizeConfig.screenWidth/10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Total for $date :  $total \$",
                                      style: const TextStyle(
                                          color: ColorPalette.lightPink,
                                          fontSize: 16)),
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: spendings.length,
                                itemBuilder: (context, index) {
                                  return Padding(
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
                                      child: Container(
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
                                           
                                            trailing: Text(
                                                spendings[index]
                                                        .price
                                                        .toString() +
                                                    '\$',
                                                style: const TextStyle(
                                                    color: Colors.white)),
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
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    indent: SizeConfig.screenWidth / 10,
                                    endIndent: SizeConfig.screenWidth / 10,
                                  );
                                },
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
