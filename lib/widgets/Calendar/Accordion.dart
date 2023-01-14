import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/constants/ColorPalette.dart';

class AccordionWidget extends StatefulWidget {
  const AccordionWidget(
      {Key? key, required this.title, required this.data, required this.color})
      : super(key: key);
  final String title;
  final List<String> data;
  final Color color;
  @override
  State<AccordionWidget> createState() => _AccordionWidgetState();
}

class _AccordionWidgetState extends State<AccordionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20)),
      child: ExpansionTile(
        
        title: Text(widget.title,style: TextStyle(color: Colors.white),),
        children: <Widget>[
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.data.length,
        
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widget.data[index]),
            );
          },
        ),

        ],
      ),
    );
  }
}
