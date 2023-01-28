import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'home.dart';

const int _black = 0x00000000;

void main() {
  setPathUrlStrategy();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nike',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0x00000000,
          <int, Color>{
            50: Color(_black),
            100: Color(_black),
            200: Color(_black),
            300: Color(_black),
            400: Color(_black),
            500: Color(_black),
            600: Color(_black),
            700: Color(_black),
            800: Color(_black),
            900: Color(_black),
          },
        ),
        textTheme: const TextTheme(
          headline4: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          headline3: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          headline1: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
