import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/posts_provider.dart';
import '../widgets/empty_state.dart';
import '../widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = context.watch<PostsProvider>().posts;
    if (posts.isEmpty) {
      return const EmptyState(
          icon: Icons.forum_outlined, message: 'No posts yet.');
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: posts.length,
      itemBuilder: (context, i) => PostCard(post: posts[i]),
    );
  }
}
