import 'package:flutter/material.dart';

class aboutUs extends StatelessWidget {
  const aboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 53, 71, 74),
      child: Center(
          child: Text('this is our final AP project in SBU. the project name referes to the dormitory room number.'
              ' actually, it took 2 weeks to build. this is just its UI version and we are working to develope its servers'
              ' and back-end soon. hope to enjoy our app :)',
            style: TextStyle(
                color: Color.fromARGB(255, 105, 231, 164),
                fontSize: 15,
                fontFamily: 'Mazzard',
                fontWeight: FontWeight.bold),),
      ),
    );
  }
}