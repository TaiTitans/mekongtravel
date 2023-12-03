import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mekongtravel/core/constants/dashboard.dart';
import 'package:mekongtravel/screens/home_page.dart';
import 'package:mekongtravel/screens/settings.dart';
import 'package:mekongtravel/screens/sign_in.dart';
import 'package:mekongtravel/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constants/dataitems_constants.dart';
import 'core/constants/color_constants.dart';
import './screens/sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({
    required this.token,
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (token != null) {
      bool isTokenValid = isTokenNotExpired(token);
      if (isTokenValid) {
        return MaterialApp(
          title: 'MekongTravel',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'BeVietnamPro',
            scaffoldBackgroundColor: ColorPalette.backgroundColor,
          ),
          initialRoute: '/welcome', // Change the initial route
          routes: {
            '/welcome': (context) => WelcomeScreen(token: token),
            '/login': (context) => SignIn(),
            '/logout': (context) => Settings(),
            // Other routes if needed
          },
          home: WelcomeScreen(token: "token"),
        );
      }
    }
    
    // Handle invalid token here, e.g., show a login screen.
    return MaterialApp(
      title: 'MekongTravel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'BeVietnamPro',
        scaffoldBackgroundColor: ColorPalette.backgroundColor,
      ),
      home: SignIn(),
    );
  }

  bool isTokenNotExpired(String? token) {
    if (token == null) {
      return false;
    }

    DateTime? expirationDate = JwtDecoder.getExpirationDate(token);
    if (expirationDate == null) {
      return false;
    }

    DateTime now = DateTime.now();
    return now.isBefore(expirationDate);
  }
}
