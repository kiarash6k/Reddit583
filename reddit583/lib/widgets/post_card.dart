import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/post.dart';
import '../state/posts_provider.dart';
import 'community_avatar.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final posts = context.read<PostsProvider>();
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final muted = TextStyle(color: scheme.onSurfaceVariant);

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CommunityAvatar(name: post.communityName, radius: 18),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.communityName,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text('u/${post.author}',
                        style: theme.textTheme.bodySmall?.merge(muted)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(post.title, style: theme.textTheme.titleMedium),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(post.body,
                  style: theme.textTheme.bodyMedium?.merge(muted)),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                IconButton(
                  tooltip: 'Upvote',
                  visualDensity: VisualDensity.compact,
                  color:
                      post.vote == VoteState.up ? scheme.primary : muted.color,
                  icon: Icon(post.vote == VoteState.up
                      ? Icons.thumb_up_alt
                      : Icons.thumb_up_alt_outlined),
                  onPressed: () => posts.toggleUpvote(post.id),
                ),
                Text('${post.votes}', style: theme.textTheme.titleSmall),
                IconButton(
                  tooltip: 'Downvote',
                  visualDensity: VisualDensity.compact,
                  color: post.vote == VoteState.down
                      ? scheme.primary
                      : muted.color,
                  icon: Icon(post.vote == VoteState.down
                      ? Icons.thumb_down_alt
                      : Icons.thumb_down_alt_outlined),
                  onPressed: () => posts.toggleDownvote(post.id),
                ),
                const SizedBox(width: 4),
                Icon(Icons.mode_comment_outlined, color: muted.color, size: 22),
                const Spacer(),
                IconButton(
                  tooltip: post.isSaved ? 'Remove from saved' : 'Save',
                  color: post.isSaved ? scheme.primary : muted.color,
                  icon: Icon(
                      post.isSaved ? Icons.bookmark : Icons.bookmark_border),
                  onPressed: () => posts.toggleSave(post.id),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
