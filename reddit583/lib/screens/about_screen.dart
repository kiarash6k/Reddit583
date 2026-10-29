import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Reddit583', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 16),
          Text(
            'Reddit583 is the final Advanced Programming project of our course '
            'at SBU. The name refers to the dormitory room number where it was '
            'built, in about two weeks.',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 12),
          Text(
            'This is the UI version of the app. Servers and a back end are '
            'planned next. We hope you enjoy it!',
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
