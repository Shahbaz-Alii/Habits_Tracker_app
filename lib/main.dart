import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Pages/splash_page.dart';

void main() async{
  // initialize hive local database
   await Hive.initFlutter();
  // open a box and make a reference for use of another place
   await Hive.openBox("Habit_Database");
  // call the class that have material app method
  runApp(const HabitTracker());
  // set the orientation portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
}

class HabitTracker extends StatelessWidget {
  const HabitTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Habits Tracker',
        theme:
        ThemeData.dark(),
        //    ThemeData(
        //    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        //    useMaterial3: true,
        //   ),
        home: const SplashPage()
    );
  }
}
