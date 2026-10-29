import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes.dart';
import '../state/communities_provider.dart';
import '../widgets/community_avatar.dart';
import '../widgets/empty_state.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CommunitiesProvider>();
    final communities = provider.communities;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: communities.isEmpty
          ? const EmptyState(
              icon: Icons.groups_outlined,
              message: 'No communities yet. Create one!',
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 88),
              itemCount: communities.length,
              itemBuilder: (context, i) {
                final community = communities[i];
                return Card(
                  child: ListTile(
                    leading: CommunityAvatar(name: community.name),
                    title: Text(
                      community.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      tooltip: 'Delete ${community.name}',
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        final index = provider.remove(community);
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text('${community.name} deleted'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () =>
                                    provider.restore(community, index),
                              ),
                            ),
                          );
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create community',
        onPressed: () => Navigator.pushNamed(context, Routes.createCommunity),
        child: const Icon(Icons.add),
      ),
    );
  }
}
