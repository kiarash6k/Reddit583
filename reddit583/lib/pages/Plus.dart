// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors
import 'package:flutter/material.dart';

class Plus extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 71, 74),
      body: Center(
        child: Text('Feed',
            style: TextStyle(
                color: Color.fromARGB(255, 105, 231, 164),
                fontSize: 20,
                fontFamily: 'Mazzard',
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}