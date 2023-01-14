import 'package:flutter/material.dart';
import 'package:my_journey/Screens/ConfigureScheduleScreen.dart';
import 'package:my_journey/Screens/HomeScreen.dart';
import 'package:my_journey/constants/ColorPalette.dart';
import 'package:my_journey/Screens/AnalyticsScreen.dart';
import 'package:my_journey/constants/SharedPrefs.dart';
import 'package:my_journey/screensize/ScreenSize.dart';
import 'package:my_journey/widgets/Calendar/Calendar.dart';
import 'package:my_journey/widgets/ProgressChartWidget.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async {
   WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPrefs instance.
  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/calendar': (context) => const Home(),
        '/today': (context) => const ConfigurationScreen(),
      },
    );
  }
}
