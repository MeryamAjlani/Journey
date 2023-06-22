// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'dart:math' as math;

import 'package:my_journey/screensize/ScreenSize.dart';


class CustomListTile extends StatefulWidget {
  const CustomListTile(
      {Key? key,
      required this.title,
      required this.status,
      this.price,
      this.icon,
      this.date})
      : super(key: key);
  final String title;
  final bool? status;
  final IconData? icon;
  final String? date;
  final double? price;
  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color.fromARGB(89, 205, 245, 219),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            subtitle: widget.status!
                ? Text(
                    "paid on : ${widget.date}",
                    style: TextStyle(color: Color.fromARGB(159, 255, 255, 255)),
                  )
                : null,
            onTap: () => {
              //context.read<BudgetBloc>().add(
              //  UpdateBudgetEntry(
              //    entry: monthlySpendings[index]))
            },
            leading: Icon(
              widget.icon,
              color: ColorPalette.lightGreen,
              size: 25,
            ),
            trailing: widget.status!
                ? Transform.rotate(
                    angle: -math.pi / 4,
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/images/Green Paw.png')),
                  )
                : null,
            title: Row(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.screenWidth / 4),
                  child: Text('${widget.price} €',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
