// ign
//ore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'Screens/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/imageedit_2_7305567590.png',),
        duration: 1700,
        splashTransition: SplashTransition.decoratedBoxTransition,
        backgroundColor: Color.fromARGB(255, 32, 35, 34),
        nextScreen: WelcomeScreen(),
      ),
    );
  }
}

