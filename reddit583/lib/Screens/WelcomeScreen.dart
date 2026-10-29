// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_label
import 'package:flutter/material.dart';
import 'package:reddit583/Screens/LoginScreen.dart';
import 'package:reddit583/Screens/SignUpScreen.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    theme:
    ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 205, 28, 28));
    return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                        radius: 2,
                        center: Alignment(-0.7, -0.6),
                        colors: [
                      Color.fromARGB(255,40,90,82),
                      Color.fromARGB(255, 53,71,74),
                    ])),
                child: Center(
                    child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.asset(
                        'assets/images/imageedit_2_7305567590.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 150, 20, 40),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                            backgroundColor: Color.fromARGB(255, 105,231,164),
                            textStyle: TextStyle(
                                color: Color.fromARGB(255, 205, 28, 28),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                        )),
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Text(
                            'Already a Member ? ',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 105,231,164),
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    offset: Offset(1.0, 1.0),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                          ),
                        ])),
                  ],
                )))));
  }
}

// class CustomShapeBorder extends ContinuousRectangleBorder {
//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     final double innerCircleRadius = 150.0;

//     double x = 150, y = 45, r = 0.5;
//     Path path = Path()
//       ..addRRect(RRect.fromRectAndCorners(rect))
//       ..moveTo(rect.bottomRight.dx - 30, rect.bottomCenter.dy)
//       ..relativeQuadraticBezierTo(
//           ((-x / 2) + (x / 6)) * (1 - r), 0, -x / 2 * r, y * r)
//       ..relativeQuadraticBezierTo(
//           -x / 6 * r, y * (1 - r), -x / 2 * (1 - r), y * (1 - r))
//       ..relativeQuadraticBezierTo(
//           ((-x / 2) + (x / 6)) * (1 - r), 0, -x / 2 * (1 - r), -y * (1 - r))
//       ..relativeQuadraticBezierTo(-x / 6 * r, -y * r, -x / 2 * r, -y * r);

//     return path;
//   }
// }
class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // ignore: prefer_const_declarations
    final double innerCircleRadius = 150.0;

    Path path = Path();
    path.lineTo(0, rect.height);
    path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30,
        rect.height + 15, rect.width / 2 - 75, rect.height + 50);
    path.cubicTo(
        rect.width / 2 - 40,
        rect.height + innerCircleRadius - 40,
        rect.width / 2 + 40,
        rect.height + innerCircleRadius - 40,
        rect.width / 2 + 75,
        rect.height + 50);
    path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30,
        rect.height + 15, rect.width, rect.height);
    path.lineTo(rect.width, 0.0);
    path.close();

    return path;
  }
}
