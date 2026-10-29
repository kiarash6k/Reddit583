import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../data/mock_data.dart';
import '../models/post.dart';

class PostsProvider extends ChangeNotifier {
  PostsProvider({List<Post>? initialPosts})
      : _posts = List.of(initialPosts ?? mockPosts);

  final List<Post> _posts;
  int _idSeed = DateTime.now().microsecondsSinceEpoch;

  UnmodifiableListView<Post> get posts => UnmodifiableListView(_posts);

  List<Post> get savedPosts => _posts.where((p) => p.isSaved).toList();

  void addPost({
    required String communityName,
    required String title,
    required String body,
    String author = 'you',
  }) {
    _posts.insert(
      0,
      Post(
        id: 'post-${_idSeed++}',
        communityName: communityName,
        author: author,
        title: title.trim(),
        body: body.trim(),
      ),
    );
    notifyListeners();
  }

  void toggleUpvote(String id) => _toggleVote(id, VoteState.up);

  void toggleDownvote(String id) => _toggleVote(id, VoteState.down);

  void toggleSave(String id) =>
      _update(id, (p) => p.copyWith(isSaved: !p.isSaved));

  void _toggleVote(String id, VoteState target) => _update(
        id,
        (p) => p.copyWith(vote: p.vote == target ? VoteState.none : target),
      );

  void _update(String id, Post Function(Post) change) {
    final index = _posts.indexWhere((p) => p.id == id);
    if (index == -1) return;
    _posts[index] = change(_posts[index]);
    notifyListeners();
  }
}
