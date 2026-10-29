import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/communities_provider.dart';
import '../state/posts_provider.dart';
import '../utils/validators.dart';
import '../widgets/app_text_field.dart';
import '../widgets/empty_state.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key, this.onPosted});

  /// Called after a post is created, e.g. to switch back to the feed.
  final VoidCallback? onPosted;

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _body = TextEditingController();
  String? _community;

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<PostsProvider>().addPost(
          communityName: _community!,
          title: _title.text,
          body: _body.text,
        );
    FocusScope.of(context).unfocus();
    _title.clear();
    _body.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Post uploaded successfully!')),
    );
    widget.onPosted?.call();
  }

  @override
  Widget build(BuildContext context) {
    final names = context
        .watch<CommunitiesProvider>()
        .communities
        .map((c) => c.name)
        .toList();
    if (names.isEmpty) {
      return const EmptyState(
        icon: Icons.groups_outlined,
        message: 'Create a community first to start posting.',
      );
    }
    if (!names.contains(_community)) _community = names.first;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              key: ValueKey(_community),
              initialValue: _community,
              decoration: const InputDecoration(labelText: 'Community'),
              items: [
                for (final name in names)
                  DropdownMenuItem(value: name, child: Text(name)),
              ],
              onChanged: (value) => setState(() => _community = value),
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _title,
              label: 'Title',
              textInputAction: TextInputAction.next,
              validator: (v) =>
                  Validators.notEmpty(v, 'Title should not be empty'),
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _body,
              label: 'Text',
              maxLines: 6,
              keyboardType: TextInputType.multiline,
              validator: (v) =>
                  Validators.notEmpty(v, 'Text should not be empty'),
            ),
            const SizedBox(height: 24),
            FilledButton(onPressed: _submit, child: const Text('Post')),
          ],
        ),
      ),
    );
  }
}
