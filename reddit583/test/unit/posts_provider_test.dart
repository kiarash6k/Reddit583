import 'package:flutter_test/flutter_test.dart';
import 'package:reddit583/models/post.dart';
import 'package:reddit583/state/posts_provider.dart';

const _post = Post(
  id: 'p1',
  communityName: 'r/Test',
  author: 'tester',
  title: 'Title',
  body: 'Body',
  baseVotes: 10,
);

void main() {
  late PostsProvider provider;

  setUp(() => provider = PostsProvider(initialPosts: [_post]));

  test('upvote adds one vote and toggles off', () {
    provider.toggleUpvote('p1');
    expect(provider.posts.single.votes, 11);
    provider.toggleUpvote('p1');
    expect(provider.posts.single.votes, 10);
  });

  test('switching from upvote to downvote swings the score by two', () {
    provider.toggleUpvote('p1');
    provider.toggleDownvote('p1');
    expect(provider.posts.single.vote, VoteState.down);
    expect(provider.posts.single.votes, 9);
  });

  test('save toggles and is listed in savedPosts', () {
    expect(provider.savedPosts, isEmpty);
    provider.toggleSave('p1');
    expect(provider.savedPosts.single.id, 'p1');
    provider.toggleSave('p1');
    expect(provider.savedPosts, isEmpty);
  });

  test('addPost puts the new post first and notifies', () {
    var notified = 0;
    provider.addListener(() => notified++);
    provider.addPost(communityName: 'r/Test', title: ' New ', body: ' Text ');
    expect(provider.posts.first.title, 'New');
    expect(provider.posts.first.body, 'Text');
    expect(provider.posts.length, 2);
    expect(notified, 1);
  });

  test('unknown ids are ignored', () {
    provider.toggleUpvote('missing');
    expect(provider.posts.single.votes, 10);
  });
}
