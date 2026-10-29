
import 'package:flutter/material.dart';

import '../pages/AccountPage.dart';
import 'AddCommunity.dart';
import 'LoginScreen.dart';
import 'about_us.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: .1),
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 10.0, // has the effect of extending the shadow
            
          )
        
        ],
      color: Color.fromARGB(255, 53, 71, 74),),
      child: SizedBox(
        width: 250,
        height: 500,
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/yoda2.png'),
                  ),
              Text('Baby Yoda',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              
              ),),
              Text('StarWars@hotmail.com',style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white
              
              ),),
              // CircleAvatar(
              //   backgroundColor: Colors.white,
              //   child: Text(
              //     'U',
              //     style: TextStyle(color: Colors.black),
              //   ),
              // ),
                ],),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(0, 255, 255, 255),
                child: Icon(
                  Icons.manage_accounts_outlined,
                  size: 20,
                  color: Color.fromARGB(255, 105, 231, 164),
                ),
              ),
              title: Text('Account',
                  style: TextStyle(
                      color: Color.fromARGB(255, 105, 231, 164),
                      fontSize: 15,
                      fontFamily: 'Mazzard',
                      fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => accountPage()));
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(0, 255, 255, 255),
                child: Icon(
                  Icons.create_outlined,
                  size: 20,
                  color: Color.fromARGB(255, 105, 231, 164),
                ),
              ),
              title: Text('Create Forum',
                  style: TextStyle(
                      color: Color.fromARGB(255, 105, 231, 164),
                      fontSize: 15,
                      fontFamily: 'Mazzard',
                      fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddCommunity()));
              
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(0, 255, 255, 255),
                child: Icon(
                  Icons.bookmark_outline,
                  size: 20,
                  color: Color.fromARGB(255, 105, 231, 164),
                ),
              ),
              title: Text('Saved Posts',
                  style: TextStyle(
                      color: Color.fromARGB(255, 105, 231, 164),
                      fontSize: 15,
                      fontFamily: 'Mazzard',
                      fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(0, 255, 255, 255),
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 25,
                  color: Color.fromARGB(255, 105, 231, 164),
                ),
              ),
              title: Text('About Us',
                  style: TextStyle(
                      color: Color.fromARGB(255, 105, 231, 164),
                      fontSize: 15,
                      fontFamily: 'Mazzard',
                      fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => aboutUs()));
              },
            ),
            ListTile(
              title: Text('Logout',
                  style: TextStyle(
                      color: Color.fromARGB(255, 105, 231, 164),
                      fontSize: 15,
                      fontFamily: 'Mazzard',
                      fontWeight: FontWeight.bold)),
              leading: Icon(
                Icons.exit_to_app,
                color: Color.fromARGB(255, 105, 231, 164),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
        //child: Container(color: Colors.amberAccent,),
      ),
    );
  }
}
