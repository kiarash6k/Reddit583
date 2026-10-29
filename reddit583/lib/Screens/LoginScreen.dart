import 'package:flutter/material.dart';
import 'Home_page.dart';
import 'SignUpScreen.dart';
import 'SocialButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController user, pass;
  String? userError, passError;
  bool isHidden = true;
  late SnackBar alarm;
  @override
  void initState() {
    user = TextEditingController();
    pass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    user.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                backgroundColor: Color.fromARGB(255, 40, 90, 82),
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  title: Text('Login'),
                  centerTitle: true,
                  backgroundColor: Color.fromARGB(237, 55, 72, 77),
                  foregroundColor: Color.fromARGB(255, 101, 223, 165),
                ),
                body: Container(
                    child: Container(
                  margin:
                      EdgeInsets.only(top: 10, right: 40, left: 40, bottom: 20),
                  //color: Color.fromARGB(165, 255, 254, 254),
                  child: Column(children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(40.0, 60.0, 40.0, 0.0),
                        child: TextField(
                          controller: user,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            errorText: userError,
                            hintText: 'Username',
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 105, 231, 164),
                                    width: 2.5)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 105, 231, 164),
                                    width: 3.5)),
                            contentPadding:
                                EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 0.0),
                        child: TextField(
                          controller: pass,
                          obscureText: isHidden,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () => {
                                setState(() {
                                  isHidden = !isHidden;
                                })
                              },
                              child: Icon(
                                Icons.visibility,
                                color: Color.fromARGB(255, 105, 231, 164),
                              ),
                            ),
                            errorText: passError,
                            hintText: 'password',
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 105, 231, 164),
                                    width: 2.5)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 105, 231, 164),
                                    width: 3.5)),
                            contentPadding:
                                EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                          ),
                        )),
                    Container(

                        margin: EdgeInsets.fromLTRB(140.0, 3.0, 0.0, 0.0),
                        child: MaterialButton(
                          
                          elevation: 12.0,
                          height: 5,
                          //minWidth: 250,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          onPressed: () {
                            String username = user.text;
                            String password = pass.text;
                            RegExp capitalLetter = RegExp(r'[A-Z]');
                            RegExp smallLetter = RegExp(r'[a-z]');
                            RegExp number = RegExp(r'[0-9]');
                            FocusScope.of(context).requestFocus(FocusNode());
                            setState(() {
                              if (username.length < 4) {
                                userError =
                                    'username must be at least 4 characters';
                              } else if (password.length < 8 ||
                                  !capitalLetter.hasMatch(password) || !smallLetter.hasMatch(password) ||
                                  !number.hasMatch(password)) {
                                userError = null;
                                passError =
                                    'password must be at least 8 characters'
                                        ' and contain at least one smallLetter, one capitalLetter and a number';
                              } else {
                                userError = null;
                                passError = null;
                                alarm = SnackBar(
                                    content: Text(
                                        'Login successful. welcome ${user.text}. have fun!'));
                                ScaffoldMessenger.of(context).showSnackBar(alarm);
                              }
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          },
                          child: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 105, 231, 164),
                            child: Icon(
                              Icons.arrow_right_alt_sharp,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 40,
                            ),
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Not a member yet ? ',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Color.fromARGB(255, 105, 231, 164),
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        offset: Offset(1.0, 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()),
                                  );
                                },
                              ),
                            ])),
                    Divider(
                      color: Colors.black,
                      indent: 300,
                      endIndent: 300,
                      thickness: 0.2,
                    ),
                    GestureDetector(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 105, 231, 164),
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
                              builder: (context) => SignUpScreen() //check//
                              ),
                        );
                      },
                    ),
                    Container(
                      child: Text(
                        '\nOr \n',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromARGB(255, 105, 231, 164),
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Color.fromARGB(255, 255, 255, 255),
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Column(
                          children: [
                            
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()),
                                  )
                                },
                                child: SocialButton(twitterIcon, const Color(0xFF1DA1F2),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey,
                              margin: EdgeInsets.only(left: 10.0),
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()),
                                  )
                                },
                                child: SocialButton(appleIcon, Colors.black,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
                              child: GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()),
                                  )
                                },
                                child: SocialButton(googleIcon, const Color(0xFFDB4437),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                )))));
  }
}
