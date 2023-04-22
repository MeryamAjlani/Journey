import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/Shared/EmptyWidget.dart';

class StyledContained extends StatefulWidget {
  const StyledContained(
      {Key? key,
      required this.title,
      required this.list,
      required this.color,
      required this.imageURL,
      required this.emptyMessage})
      : super(key: key);
  final String imageURL;
  final String emptyMessage;
  final String title;
  final List list;
  final Color color;
  @override
  State<StyledContained> createState() => _StyledContainedState();
}

class _StyledContainedState extends State<StyledContained> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 25, 4, 40)),
      child: Padding(
        padding: const EdgeInsets.only(bottom:40.0,top: 20),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding:
                  EdgeInsets.only(left: SizeConfig.screenWidth / 10, bottom: 20),
              child: Text(
                widget.title,
                style: TextStyle(
                    color: widget.color, fontSize: 20, fontFamily: 'Pacifico'),
              ),
            ),
          ),
          if (widget.list.isEmpty)
            Center(
                child: SizedBox(
                    child: EmptyWidget(
              imagePath: widget.imageURL,
              message: widget.emptyMessage,
              color: widget.color,
            )))
          else
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: SizeConfig.screenWidth / 10,
                        left: SizeConfig.screenWidth / 10,
                      ),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 4.0, color: widget.color),
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.list[index].title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ))),
                      ),
                    ),
                  );
                }),
        ]),
      ),
    );
  }
}
