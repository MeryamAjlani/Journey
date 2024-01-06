import 'package:flutter/material.dart';
import 'package:my_journey/Blocs/budget_bloc/budget_bloc.dart';
import 'package:my_journey/Blocs/groceries_bloc/groceries_bloc.dart';
import 'package:my_journey/Blocs/monthly_spendings/monthly_spendings_bloc.dart';
import 'package:my_journey/Screens/Authentication/AuthentificationScreen.dart';
import 'package:my_journey/Screens/Authentication/LoginScreen.dart';
import 'package:my_journey/Screens/ParamsScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_journey/Blocs/Task_bloc/tasks_bloc.dart';
import 'package:my_journey/Blocs/bloc/switch_bloc.dart';
import 'package:my_journey/Screens/ConfigureScheduleScreen.dart';
import 'package:my_journey/Screens/HomeScreen.dart';
import 'package:my_journey/Services/AppTheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => GroceriesBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => MonthlySpendingsBloc(),
        ),
        BlocProvider(create: (context) => BudgetBloc())
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Tasks App',
            initialRoute: '/',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            routes: {
              '/': (context) => const AuthentificationScreen(),
              '/calendar': (context) => const Home(),
              '/today': (context) => const ConfigurationScreen(),
              '/settings': (context) => const ParamsScreen(),
            },
          );
        },
      ),
    );
  }
}
