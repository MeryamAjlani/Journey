import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_journey/screensize/ScreenSize.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.only(top:SizeConfig.screenHeight/40),
                    height: SizeConfig.screenHeight / 10,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 118, 9, 9),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 48,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                'Oops !',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Text(
                                'The groceries list is empty',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: SizeConfig.screenHeight/18,
                      left: 20,
                      child: ClipRRect(
                        child: Stack(
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.red.shade200,
                              size: 17,
                            )
                          ],
                        ),
                      )),
                  Positioned(
                      top: -20,
                      left: 5,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          const Positioned(
                              top: 5,
                              child: Icon(
                                
                                Icons.clear_outlined,
                                color: Colors.white,
                                size: 20,
                              ))
                        ],
                      )),
                ],
              );
  }
}