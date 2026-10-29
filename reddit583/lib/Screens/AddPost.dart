import 'package:flutter/material.dart';
import 'package:reddit583/Screens/Home_page.dart';


class AddPost extends StatefulWidget {
  final Function? addPost;
  AddPost({super.key, this.addPost});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late TextEditingController titleController, textController;
  String? titleError, textError;
  late SnackBar alarm;
  @override
  void initState() {
    titleController = TextEditingController();
    textController = TextEditingController();

    super.initState();
  }
  @override
  void dispose() {
    titleController.dispose();
    textController.dispose();
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
              width: 450.0,
              margin: EdgeInsets.only(top: 15.0),
              child: TextField(
                controller: titleController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  errorText: titleError,
                  hintText: 'post title',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 1.5)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 1.5)),
                  contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                ),
              )
          ),
          Container(
              alignment: Alignment.center,
              width: 450.0,
              margin: EdgeInsets.only(top: 15.0),
              child: TextField(
                controller: textController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  errorText: textError,
                  hintText: 'post text',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 1.5)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Color.fromARGB(255, 105, 231, 164), width: 1.5)),
                  contentPadding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 14.0),
                ),
              )
          ),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50.0, left:0),
              child: MaterialButton(
                elevation: 12.0,
                height: 50,
                minWidth: 350,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {
                  String title = titleController.text;
                  String text = textController.text;
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    if(title.isEmpty) {
                      if(text.isEmpty) {
                        textError = 'text should not be empty';
                      } else {
                        textError = null;
                      }
                      titleError = 'title should not be empty';
                    } else if(text.isEmpty) {
                      if(title.isEmpty) {
                        titleError = 'title should not be empty';
                      } else {
                        titleError = null;
                      }
                      textError = 'text should not be empty';
                    } else {
                      titleError = null;
                      textError = null;
                      alarm = SnackBar(content: Text('post uploaded successfully!'));
                      ScaffoldMessenger.of(context).showSnackBar(alarm);
                      //widget.addPost(Post(title, text, false, false, 0, false));
                      titleController.clear();
                      textController.clear();
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                    }
                  });
                },
                color: Colors.teal,
                child: Text('create',
                    style: TextStyle(
                      color: Colors.cyan,
                    )),
              )),
        ],
      ),
    );
  }
}