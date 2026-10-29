import 'package:flutter/material.dart';

import '../MainClasses/Community.dart';
import '../MainClasses/Post.dart';

class ShowPosts extends StatefulWidget {
  final Community community;
  final Post post;
  final Function removePost;
  ShowPosts(this.community, this.post, this.removePost, {super.key});

  @override
  State<ShowPosts> createState() => _ShowPostsState();
}

class _ShowPostsState extends State<ShowPosts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: [
            Material(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      widget.community.getNetworkURL()),
                ),
                title: Text(widget.community.getCommunityName()),
                subtitle: Text('u/user_name'),
              ),),
            Material(
              child: ListTile(
                title: Text(widget.post.getTitle()),
                subtitle: Text(widget.post.getText()),
              ),),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: widget.post.isPostLiked() ? Icon(
                            Icons.thumb_up_alt) : Icon(
                            Icons.thumb_up_alt_outlined),
                        onTap: () {
                          setState(() {
                            widget.post.setLiked(!widget.post.isPostLiked());
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(widget.post.getVotes().toString(),
                            style: TextStyle(fontSize: 16.0, color: Colors
                                .black)),
                      ),
                      GestureDetector(
                          child: widget.post.isPostDislike() ? Icon(
                              Icons.thumb_down_alt) : Icon(
                              Icons.thumb_down_alt_outlined),
                          onTap: () {
                            setState(() {
                              widget.post.setDislike(!widget.post
                                  .isPostDislike());
                            });
                          }
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(Icons.chat_bubble_outlined),
                      )
                    ],
                  ),
                  GestureDetector(
                      child: widget.post.isPostMarked()
                          ? Icon(Icons.bookmark)
                          : Icon(Icons.bookmark_border_outlined),
                      onTap: () {
                        setState(() {
                          widget.post.setMarked(!widget.post.isPostMarked());
                        });
                      }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}