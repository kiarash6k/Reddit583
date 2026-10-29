import 'package:flutter/material.dart';

class accountPage extends StatefulWidget {
  const accountPage({super.key});

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  late TextEditingController user, email;
  String User = 'Baby Yoda';
  String Email = 'StarWars@hotmail.com';

  @override
  void initState() {
    user = TextEditingController();

    email = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 71, 74),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 40, 90, 82),
        foregroundColor: Color.fromARGB(255, 105, 231, 164),
        title: Text('Account'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          margin: MediaQuery.of(context).padding,
          child: Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/yoda2.png'),
              ),
              Text(
                User,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                Email,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              // CircleAvatar(
              //   backgroundColor: Colors.white,
              //   child: Text(
              //     'U',
              //     style: TextStyle(color: Colors.black),
              //   ),
              // ),
              Text('\n\n\n'),
              SizedBox(
                width: MediaQuery.of(context).size.width/2,
                //color: Colors.pink,
                child: TextField(
                          controller: user,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(

                            hintText: User,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 2.5)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 3.5)),
                            contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                          ),
                        )
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*.7,
                //color: Colors.pink,
                child: TextField(
                          controller: email,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(

                            hintText: Email,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 2.5)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 3.5)),
                            contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                          ),
                        )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
