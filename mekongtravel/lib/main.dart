import 'package:flutter/material.dart';
import 'package:mekongtravel/screens/welcome_screen.dart';
import 'core/constants/dataitems_constants.dart';
import 'core/constants/color_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MekongTravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'BeVietnamPro',
        scaffoldBackgroundColor: ColorPalette.backgroundColor,
      ),
      home: WelcomeScreen(),
    );
  }
}
