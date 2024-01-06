// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_bloc.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_event.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_state.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:intl/intl.dart';
import 'package:my_journey/widgets/Shared/EmptyWidget.dart';
import 'dart:math' as math;
import 'package:my_journey/widgets/Shared/SpeedDial.dart';

class PurchaseListScreen extends StatefulWidget {
  const PurchaseListScreen({Key? key}) : super(key: key);

  @override
  State<PurchaseListScreen> createState() => _PurchaseListScreenState();
}

class _PurchaseListScreenState extends State<PurchaseListScreen> {
  @override
  Widget build(BuildContext context) {
    String date = DateFormat.yMMMEd().format(DateTime.now());
    //final spendings = context.watch<GroceriesBlocBloc>().state.allSpendings;
    final groceries = context.watch<GroceriesBloc>().state.allGroceries;
    print(groceries);
    return BlocBuilder<GroceriesBloc, GroceryState>(
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: SpeedDialWidget(),
            backgroundColor: PurpleColorPalette.background,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: SizeConfig.screenHeight / 20),
                    child: groceries.isEmpty
                        ? EmptyWidget(
                            imagePath: "assets/images/Pink Paw.png",
                            message: "No Groceries added yet !",
                            color: PurpleColorPalette.highLight2)
                        : Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: SizeConfig.screenHeight / 20,
                                    left: SizeConfig.screenWidth / 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Grocery list for the  $date ",
                                      style: const TextStyle(
                                          color: PurpleColorPalette.highLight2,
                                          fontSize: 16)),
                                ),
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: groceries.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        right: SizeConfig.screenWidth / 10,
                                        left: SizeConfig.screenWidth / 10),
                                    child: Dismissible(
                                      key: UniqueKey(),
                                      onDismissed: (direction) {
                                        context.read<GroceriesBloc>().add(
                                            DeleteGroceryEntry(
                                                groceryEntry:
                                                    groceries[index]));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                            width: 4.0,
                                            color:
                                                PurpleColorPalette.highLight1,
                                          )),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                            onTap: () => {
                                              context.read<GroceriesBloc>().add(
                                                  UpdateGroceryEntry(
                                                      groceryEntry:
                                                          groceries[index]))
                                            },
                                            trailing: groceries[index].done
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
                                              groceries[index].title,
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
                              )
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
