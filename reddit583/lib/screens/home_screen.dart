import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../routes.dart';
import '../theme/app_colors.dart';
import '../widgets/app_drawer.dart';
import 'communities_screen.dart';
import 'create_post_screen.dart';
import 'feed_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _titles = ['Home', 'Communities', 'New post', 'Settings'];

  final _navKey = GlobalKey<CurvedNavigationBarState>();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_index]),
        actions: [
          IconButton(
            tooltip: 'Log out',
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.welcome,
              (_) => false,
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: IndexedStack(
        index: _index,
        children: [
          const FeedScreen(),
          const CommunitiesScreen(),
          CreatePostScreen(onPosted: () => _navKey.currentState?.setPage(0)),
          const SettingsScreen(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _navKey,
        index: _index,
        height: 60,
        color: AppColors.teal,
        buttonBackgroundColor: AppColors.forest,
        backgroundColor: Theme.of(context).colorScheme.surface,
        items: const [
          Icon(Icons.home_filled, size: 28, color: Colors.white),
          Icon(Icons.explore, size: 28, color: Colors.white),
          Icon(Icons.add, size: 28, color: Colors.white),
          Icon(Icons.settings, size: 28, color: Colors.white),
        ],
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}
