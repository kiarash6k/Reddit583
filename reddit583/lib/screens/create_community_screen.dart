import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/communities_provider.dart';
import '../utils/validators.dart';
import '../widgets/app_text_field.dart';

class CreateCommunityScreen extends StatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  State<CreateCommunityScreen> createState() => _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends State<CreateCommunityScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final created = context.read<CommunitiesProvider>().add(_name.text);
    final messenger = ScaffoldMessenger.of(context);
    if (!created) {
      messenger.showSnackBar(
        const SnackBar(
            content: Text('A community with that name already exists.')),
      );
      return;
    }
    messenger.showSnackBar(
      SnackBar(
          content: Text(
              'r/${_name.text.trim().replaceFirst(RegExp(r'^r/', caseSensitive: false), '')} created successfully!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create community')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Name your community',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: _name,
                  label: 'r/community',
                  icon: Icons.groups_outlined,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _submit(),
                  validator: (v) => Validators.notEmpty(
                      v?.replaceFirst(RegExp(r'^r/', caseSensitive: false), ''),
                      'You have not named your community yet'),
                ),
                const SizedBox(height: 24),
                FilledButton(onPressed: _submit, child: const Text('Create')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
