import 'package:flutter/material.dart';

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
          primaryColor: ColorPalette.primaryColor,
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Mekong Travel",
                      style: TextStyle(
                        color: ColorPalette.text,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Vi vu trong tầm tay...",
                        style: TextStyle(
                            color: ColorPalette.subColorText, fontSize: 20)),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
