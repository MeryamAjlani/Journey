// ignore_for_file: prefer_const_constructors
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_bloc.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_event.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/Alert%20Dialogs/GroceriesAlertDialog.dart';
import 'package:my_journey/widgets/Alert%20Dialogs/GroceriesDialog.dart';
import 'package:my_journey/widgets/Shared/ErrorWidget.dart';

class SpeedDialWidget extends StatelessWidget {
  const SpeedDialWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groceries = context.watch<GroceriesBloc>().state.allGroceries;
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 28.0),
      backgroundColor: ColorPalette.pink,
      visible: true,
      overlayColor: ColorPalette.background,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: Icon(Icons.create, color: Colors.white),
          backgroundColor: ColorPalette.pink,
          onTap: () => showModalBottomSheet<void>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return GroceriesDialog();
            },
          ),
          label: 'Add',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: ColorPalette.background,
        ),
        SpeedDialChild(
          child: Icon(Icons.delete, color: Colors.white),
          backgroundColor: ColorPalette.pink,
          onTap: () => {
        if(groceries.isEmpty)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
              elevation: 0,
              content:CustomErrorWidget() ,
            ))
            else{ context.read<GroceriesBloc>().add(DeleteAllGroceries())}
            
          },
          label: 'Clear',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: ColorPalette.background,
        ),
        SpeedDialChild(
          child: Icon(Icons.save, color: Colors.white),
          backgroundColor: ColorPalette.pink,
          onTap: () => {
            
            if(groceries.isEmpty)  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
              elevation: 0,
              content:CustomErrorWidget() ,
            ))
            else 
            {showDialog<String>(
              context: context,
              builder: (BuildContext context) => GroceriesAlertDialog())}},
          label: 'Add to Expenses',
          labelStyle:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: ColorPalette.background,
        ),
      ],
    );
  }
}
