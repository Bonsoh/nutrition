import './custom/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'models/nutrition_day.dart';
import 'nutrition/nutrition_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => NutritionDay()),
      ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitep',
      theme: ThemeData(
        scaffoldBackgroundColor: kSecondaryColor,
        primaryColor: kPrimaryColor,
        indicatorColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: kPrimaryColor,
          secondary: kPrimaryColor,
          brightness: Brightness.dark,
          surface: kPrimaryColor,
        ),
        /// Themes
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
            )
        ),
        dialogTheme: DialogTheme(
          backgroundColor: kDecentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        appBarTheme: const AppBarTheme(
          color: kSecondaryColor,
          titleTextStyle: TextStyle(fontSize: 18, color: Colors.white),
          elevation: 2,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: Colors.black
        ),
      ),
      home: const NutritionScreen()
    ),
  );
}
