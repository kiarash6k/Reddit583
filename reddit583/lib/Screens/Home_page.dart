// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:reddit583/Screens/AddPost.dart';
import 'package:reddit583/Screens/CommunityScreen.dart';
import 'package:reddit583/Screens/PostScreen.dart';
import 'package:reddit583/Screens/WelcomeScreen.dart';
import 'package:reddit583/Screens/drawer.dart';
import 'package:reddit583/pages/Setting.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _leftPosition;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _leftPosition = Tween<double>(
      begin: -300,
      end: 20,
    ).animate(
      _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _currentTab = 'Home';
  bool isClicked = true;
  double turns = 0.0;
  Color DarkGreen = const Color.fromARGB(255, 40, 90, 82);
  Color LightGreen = const Color.fromARGB(255, 105, 231, 164);
  final Map<String, Widget> _children = {
    'Home': PostScreen(),
    'Community': CommunityScreen(),
    'Plus': AddPost(),
    'Settings': Setting(),
  };

  void changePage(int index) {
    setState(() {
      _currentTab = _children.keys.elementAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
            primaryColor:
                Color.fromARGB(255, 40, 90, 82), // Your app THEME-COLOR
          ),
          home: Scaffold(
            backgroundColor: Color.fromARGB(255, 53, 71, 74),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 40, 90, 82),
              foregroundColor: Color.fromARGB(255, 105, 231, 164),
              elevation: 20.0,
              leading: Center(
                child: InkWell(
                  onTap: _onTapMenu,
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_arrow,
                    progress: _controller.view,
                    color: Color.fromARGB(255, 105, 231, 164),
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.switch_account),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    );
                  },
                ),
              ],
            ),
            body: Stack(
              children: [
                Container(
                  child: _children[_currentTab],
                  //color: Colors.white,
                ),
                AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    left: _leftPosition.value,
                    top: 40,
                    child: Opacity(
                      opacity: _controller.value,
                      child: child,
                    )),
              ],
            ),
            bottomNavigationBar: CurvedNavigationBar(
              color: Color.fromARGB(255, 50, 113, 102),
              buttonBackgroundColor: Colors.white,
              backgroundColor: Color.fromARGB(
                  255, 84, 191, 171), //Color.fromARGB(255,40,90,82),
              items: <Widget>[
                Icon(Icons.home_filled, size: 30),
                Icon(Icons.explore, size: 30),
                Icon(Icons.add, size: 30),
                Icon(Icons.settings, size: 30),
              ],
              onTap: (index) {
                changePage(index);
              },
            ),
          ),
        );
      },
      child: drawer(),
    );
  }

  void _onTapMenu() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }
}
