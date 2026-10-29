import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _open(BuildContext context, String route) {
    Navigator.pop(context);
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF285A52)),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              accountName: Text(mockUser.username),
              accountEmail: Text(mockUser.email),
            ),
            ListTile(
              leading: const Icon(Icons.manage_accounts_outlined),
              title: const Text('Account'),
              onTap: () => _open(context, Routes.account),
            ),
            ListTile(
              leading: const Icon(Icons.group_add_outlined),
              title: const Text('Create community'),
              onTap: () => _open(context, Routes.createCommunity),
            ),
            ListTile(
              leading: const Icon(Icons.bookmark_outline),
              title: const Text('Saved posts'),
              onTap: () => _open(context, Routes.saved),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () => _open(context, Routes.about),
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.welcome,
                (_) => false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
