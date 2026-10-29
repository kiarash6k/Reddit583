import 'package:flutter/material.dart';
import 'Home_page.dart';
import 'LoginScreen.dart';
import 'SocialButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController user, pass, email, confirmPass;
  String? userError, passError, emailError, confirmPassError;
  late SnackBar alarm;
  bool isHidden = true;
  @override
  void initState() {
    user = TextEditingController();
    pass = TextEditingController();
    email = TextEditingController();
    confirmPass = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return SafeArea(child: 
     MaterialApp(
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
              backgroundColor: Color.fromARGB(237, 55, 72, 77),
                  foregroundColor: Color.fromARGB(255, 101, 223, 165),
              title: Text('Create a new account'),
              centerTitle: true,
            ),
            body: Container(
              child: Container(
                // margin: EdgeInsets.only(top: 20,right: 40,left: 40,bottom: 10),
                //margin: EdgeInsets.only(top: size.height*0.05,right: 40,left: 40,bottom: 10),

              child: Column(
                  children: <Widget>[
                    Container(
                        //margin: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 0.0),
                        margin: EdgeInsets.fromLTRB(size.width*0.2, 30.0, size.width*0.2, 0.0),
                        child: TextField(
                          controller: user,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            errorText: userError,
                            hintText: 'Username',
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 2.5)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 3.5)),
                            contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(size.width*0.2, 5.0, size.width*0.2, 0.0),
                        child: TextField(
                          controller: email,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(

                            errorText: emailError,
                            hintText: 'Email',
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 2.5)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 3.5)),
                            contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(size.width*0.2, 10.0, size.width*0.2, 0.0),
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
                              child: Icon(Icons.visibility, color: Color.fromARGB(255, 105, 231, 164),),
                            ),
                            errorText: passError,
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 2.5)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 3.5)),
                            contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                          ),
                        )
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(size.width*0.2, 5.0, size.width*0.2, 0.0),
                        child: TextField(
                          controller: confirmPass,
                          obscureText: isHidden,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () => {
                                setState(() {
                                  isHidden = !isHidden;
                                })
                              },
                              child: Icon(Icons.visibility, color: Color.fromARGB(255, 105, 231, 164),),
                            ),
                            errorText: confirmPassError,
                            hintText: 'Confirm',
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 2.5)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 3.5)),
                            contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                          ),
                        )
                    ),
                    Container(
                       margin: EdgeInsets.fromLTRB(size.width*0.5, 5.0, size.width*0.1, 0.0),
                        child: MaterialButton(
                          elevation: 12.0,
                          height: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          onPressed: () {
                            RegExp capitalLetter = RegExp(r'[A-Z]');
                            RegExp smallLetter = RegExp(r'[a-z]');
                            RegExp number = RegExp(r'[0-9]');
                            RegExp emailValidator = RegExp(r'^\w+@gmail\.com$');
                            String username = user.text;
                            String emailAddress = email.text;
                            String password = pass.text;
                            String confirmedPassword = confirmPass.text;
                            FocusScope.of(context).requestFocus(FocusNode());
                            setState(() {
                              if(username.length < 4) {
                                userError = 'username must be at least 4 characters';
                              } else if(password.length < 8 ||
                                  !capitalLetter.hasMatch(password) || !smallLetter.hasMatch(password) ||
                              !number.hasMatch(password)) {
                                userError = null;
                                emailError = null;
                                confirmPassError = null;
                                passError = 'password must be at least 8 characters'
                                    ' and contain at least one smallLetter, one capitalLetter and a number';
                              } else if (!(password == confirmedPassword)) {
                                userError = null;
                                emailError = null;
                                passError = null;
                                confirmPassError = 'does not match your password';
                              } else if (!emailValidator.hasMatch(emailAddress)) {
                                userError = null;
                                emailError = 'email is invalid';
                                passError = null;
                                confirmPassError = null;
                              } else {
                                userError = null;
                                emailError = null;
                                passError = null;
                                confirmPassError = null;
                                alarm = SnackBar(content: Text('Signup successful. welcome ${user.text}. have fun!'));
                                ScaffoldMessenger.of(context).showSnackBar(alarm);
                              }
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                            
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
                        margin: EdgeInsets.only(top: 5,),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account ? ', style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),),
                              GestureDetector(
                                child: Text('Login', style: TextStyle(
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
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return LoginScreen();
                                    },
                                  ),
                                  );
                                },),
                            ])),
                    Container(
                      child: Text('\nOr \n'),
                    ),
                    Container(

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
                    ),]),
                )))));
  }
}