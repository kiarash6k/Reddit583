import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes.dart';
import '../state/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();

    Widget tile(IconData icon, String title, String route) => ListTile(
          leading: Icon(icon, size: 28),
          title: Text(title),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.pushNamed(context, route),
        );

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        tile(Icons.manage_accounts_outlined, 'Account', Routes.account),
        tile(Icons.group_add_outlined, 'Create community',
            Routes.createCommunity),
        tile(Icons.bookmark_outline, 'Saved posts', Routes.saved),
        tile(Icons.info_outline, 'About', Routes.about),
        const Divider(),
        SwitchListTile(
          secondary: Icon(theme.isDark ? Icons.dark_mode : Icons.light_mode),
          title: const Text('Dark mode'),
          value: theme.isDark,
          onChanged: theme.setDark,
        ),
      ],
    );
  }
}
