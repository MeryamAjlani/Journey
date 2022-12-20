// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/InputWidget.dart';
import 'package:my_journey/widgets/StandardButton.dart';

class ConfigurationScreen extends StatefulWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ConfigurationScreen> createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  List<Task> tasks = [
    Task('feed Caramel'),
    Task('feed Caramel'),
    Task('feed Caramel'),
    Task('feed Caramel'),
    Task('feed Caramel')
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 18, 89),
        leading: const Icon(Icons.arrow_back),
        title:  Text(
         '${DateTime.now().toString().substring(0,10)}',style: TextStyle(color: Colors.white,fontSize: 20)),
        ),
      backgroundColor: ColorPalette.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
               
                CustomInput(
                  hintText: 'task',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z]+|\s"),
                    )
                  ],
                  validator: (val) {
                    if (val!.isNotEmpty) {
                      if (!val.isValidName) return 'Enter valid name';
                    };
                  },
                ),
                CustomButton(
                  width: SizeConfig.screenWidth * 2 / 5,
                  height: SizeConfig.screenHeight / 20,
                  onPressed: () {},
                  text: "Add Task",
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.screenWidth / 10,
                              left: SizeConfig.screenWidth / 10),
                          child: Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              // Step 2
                              setState(() {
                                tasks.removeAt(index);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: ColorPalette.lightBlue),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CheckboxListTile(
                                  activeColor: ColorPalette.lightGreen,
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  title: Text(
                                    tasks[index].name,
                                    style: const TextStyle(color: Colors.white),
                                    textAlign: TextAlign.left,
                                  ),
                                  value: tasks[index].isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      tasks[index].isChecked = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                CustomButton(
                  width: SizeConfig.screenWidth * 2 / 5,
                  height: SizeConfig.screenHeight / 20,
                  onPressed: () {},
                  text: "Save Changes ",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Task {
  late String name;
  late bool isChecked;
  Task(this.name, {this.isChecked = false});
}

// ignore: camel_case_extensions
extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
