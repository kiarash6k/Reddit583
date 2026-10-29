import 'package:flutter/material.dart';

import '../data/mock_data.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
          ),
          const SizedBox(height: 16),
          Center(
              child:
                  Text(mockUser.username, style: theme.textTheme.titleLarge)),
          const SizedBox(height: 24),
          Card(
            margin: EdgeInsets.zero,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('Username'),
                  subtitle: Text(mockUser.username),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.mail_outline),
                  title: const Text('Email'),
                  subtitle: Text(mockUser.email),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
