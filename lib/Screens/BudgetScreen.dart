// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/InputWidget.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({Key? key}) : super(key: key);

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  List<bool> selected = List<bool>.generate(8, (int index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 12, 4, 62),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.screenHeight / 50,
                horizontal: SizeConfig.screenWidth / 15),
            child: SingleChildScrollView(
                child: SizedBox(
              width: double.infinity,
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: ColorPalette.lightBlue),
                child: Column(
                  children: [
                    DataTable(
                      columnSpacing: SizeConfig.screenWidth / 3,
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text("Description",
                              style: TextStyle(
                                color: ColorPalette.lightBlue,
                              )),
                        ),
                        DataColumn(
                          label: Text("Amount",
                              style: TextStyle(
                                color: ColorPalette.lightBlue,
                              )),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        8,
                        (int index) => DataRow(
                          cells: <DataCell>[
                            DataCell(Text(
                              'nyanyanya',
                              style: TextStyle(color: Colors.white),
                            )),
                            DataCell(Text(
                              'nyanyanya',
                              style: TextStyle(color: Colors.white),
                            ))
                          ],
                        ),
                      ),
                    ),
                    TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          
          backgroundColor: ColorPalette.background,
          title: const Text('Add Entery',style: TextStyle(color: Colors.white),),
          content:Container(
           height: SizeConfig.screenHeight/4,
            child: Column(children: [
              CustomInput(hintText: 'Description'),
              CustomInput(hintText: 'Amount',inputType: TextInputType.number,)
            ]),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Add Entery'),
    )
                  ],
                ),
              ),
            )),
          ),
        ));
  }
}
