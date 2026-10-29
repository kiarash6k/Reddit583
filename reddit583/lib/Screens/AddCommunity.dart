import 'package:flutter/material.dart';
import 'package:reddit583/Screens/Home_page.dart';


class AddCommunity extends StatefulWidget {
  final Function? addCommunity;
  AddCommunity({super.key, this.addCommunity});

  @override
  State<AddCommunity> createState() => _AddCommunityState();
}

class _AddCommunityState extends State<AddCommunity> {
  late TextEditingController communityNameController;
  String? communityNameError;
  late SnackBar alarm;
  @override
  void initState() {
    communityNameController = TextEditingController();

    super.initState();
  }
  @override
  void dispose() {
    communityNameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 71, 74),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 45.0, left: 40.0),
            child: Text('Enter your community name : \n', style: TextStyle(fontFamily: 'Montserrat',fontSize: 17.0, color: Color.fromARGB(255, 105, 231, 164)),),
          ),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.only(top: 15.0),
              child: TextField(
                controller: communityNameController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  icon: Icon(Icons.people_alt_sharp, color: Color.fromARGB(255, 105, 231, 164),),
                  errorText: communityNameError,
                  hintText: 'r/community',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.5)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 1.5)),
                  contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                ),
              )
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 25.0, left: 0.0),
              child: MaterialButton(
                elevation: 12.0,
                height: 50,
                minWidth: 240,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {
                  String communityName = communityNameController.text;
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    if(communityName.isEmpty) {
                      communityNameError = 'you have not named your community yet';
                    } else {
                      communityNameError = null;
                      alarm = SnackBar(content: Text('$communityName created successfully!'));
                      ScaffoldMessenger.of(context).showSnackBar(alarm);
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                    }
                  });
                },
                color: Colors.teal,
                child: Text('creat',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    )),
              )),
        ],
      ),
    );
  }
}