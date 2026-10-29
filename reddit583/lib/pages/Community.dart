// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Community extends StatelessWidget {


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