import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/posts_provider.dart';
import '../widgets/empty_state.dart';
import '../widgets/post_card.dart';

class SavedPostsScreen extends StatelessWidget {
  const SavedPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final saved = context.watch<PostsProvider>().savedPosts;
    return Scaffold(
      appBar: AppBar(title: const Text('Saved posts')),
      body: saved.isEmpty
          ? const EmptyState(
              icon: Icons.bookmark_border,
              message: 'Posts you save will show up here.',
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: saved.length,
              itemBuilder: (context, i) => PostCard(post: saved[i]),
            ),
    );
  }
}
