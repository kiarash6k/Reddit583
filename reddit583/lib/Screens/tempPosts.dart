import 'package:flutter/material.dart';

class tempPosts extends StatefulWidget {
  const tempPosts({super.key});

  @override
  State<tempPosts> createState() => _tempPostsState();
}

class _tempPostsState extends State<tempPosts> {
  bool isPost1Liked = false;
  bool isPost1Disliked = false;
  bool isPost1Marked = false;
  bool isPost2Liked = false;
  bool isPost2Disliked = false;
  bool isPost2Marked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: [
            Material(
              child: ListTile(
                tileColor: Color.fromARGB(255, 53, 71, 74),
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://tr.rbxcdn.com/4f24f514964225c249b4dc004ebcbe64/420/420/Image/Png'),
                ),
                title: Text('r/Valorant'),
                subtitle: Text('u/valo_admin'),
              ),
            ),
            Material(
              child: ListTile(
                tileColor: Color.fromARGB(255, 53, 71, 74),
                title: Text('Finally, the agent'),
                subtitle: Text('fade and her abilities'),
              ),
            ),
            Image(
                image: NetworkImage(
                    'https://staticg.sportskeeda.com/editor/2022/04/4c384-16508257608679-1920.jpg')),
            Container(
              color: Color.fromARGB(255, 53, 71, 74),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: isPost1Liked
                            ? Icon(Icons.thumb_up_alt)
                            : Icon(Icons.thumb_up_alt_outlined),
                        onTap: () {
                          setState(() {
                            isPost1Disliked = false;
                            isPost1Liked = !isPost1Liked;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                            isPost1Liked
                                ? '1'
                                : isPost1Disliked
                                ? '-1'
                                : '0',
                            style:
                            TextStyle(fontSize: 16.0, color: Colors.black)),
                      ),
                      GestureDetector(
                          child: isPost1Disliked
                              ? Icon(Icons.thumb_down_alt)
                              : Icon(Icons.thumb_down_alt_outlined),
                          onTap: () {
                            setState(() {
                              isPost1Disliked = !isPost1Disliked;
                              isPost1Liked = false;
                            });
                          }),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(Icons.mode_comment_outlined),
                      )
                    ],
                  ),
                  GestureDetector(
                      child: isPost1Marked
                          ? Icon(Icons.bookmark)
                          : Icon(Icons.bookmark_border_outlined),
                      onTap: () {
                        setState(() {
                          isPost1Marked = !isPost1Marked;
                        });
                      }),
                ],
              ),
            ),
            ),
            Material(
              child: ListTile(
                tileColor: Color.fromARGB(255, 53, 71, 74),
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_FpknB8aQlF_bR6SZZcCWDXUCGGaWK2bzzQ&usqp=CAU'),
                ),
                title: Text('r/Champions League'),
                subtitle: Text('u/champion_admin'),
              ),
            ),
            Material(
              child: ListTile(
                tileColor: Color.fromARGB(255, 53, 71, 74),
                title: Text('champions league, final : '),
                subtitle: Text(
                    'real madrid beat liverpool in paris 1-0, vini jr. scored the goal'),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 53, 71, 74),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: isPost2Liked
                            ? Icon(Icons.thumb_up_alt)
                            : Icon(Icons.thumb_up_alt_outlined),
                        onTap: () {
                          setState(() {
                            isPost2Disliked = false;
                            isPost2Liked = !isPost2Liked;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                            isPost2Liked
                                ? '1'
                                : isPost2Disliked
                                ? '-1'
                                : '0',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black)),
                      ),
                      GestureDetector(
                          child: isPost2Disliked
                              ? Icon(Icons.thumb_down_alt)
                              : Icon(Icons.thumb_down_alt_outlined),
                          onTap: () {
                            setState(() {
                              isPost2Disliked = !isPost2Disliked;
                              isPost2Liked = false;
                            });
                          }),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(Icons.mode_comment_outlined),
                      )
                    ],
                  ),
                  GestureDetector(
                      child: isPost2Marked
                          ? Icon(Icons.bookmark)
                          : Icon(Icons.bookmark_border_outlined),
                      onTap: () {
                        setState(() {
                          isPost2Marked = !isPost2Marked;
                        });
                      })
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
