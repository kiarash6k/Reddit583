import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes.dart';
import 'screens/about_screen.dart';
import 'screens/account_screen.dart';
import 'screens/create_community_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/saved_posts_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'state/communities_provider.dart';
import 'state/posts_provider.dart';
import 'state/theme_provider.dart';
import 'theme/app_theme.dart';

class Reddit583App extends StatelessWidget {
  const Reddit583App({super.key, this.initialRoute = Routes.splash});

  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostsProvider()),
        ChangeNotifierProvider(create: (_) => CommunitiesProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) => MaterialApp(
          title: 'Reddit583',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: theme.mode,
          initialRoute: initialRoute,
          routes: {
            Routes.splash: (_) => const SplashScreen(),
            Routes.welcome: (_) => const WelcomeScreen(),
            Routes.login: (_) => const LoginScreen(),
            Routes.signUp: (_) => const SignUpScreen(),
            Routes.home: (_) => const HomeScreen(),
            Routes.account: (_) => const AccountScreen(),
            Routes.about: (_) => const AboutScreen(),
            Routes.saved: (_) => const SavedPostsScreen(),
            Routes.createCommunity: (_) => const CreateCommunityScreen(),
          },
        ),
      ),
    );
  }
}
