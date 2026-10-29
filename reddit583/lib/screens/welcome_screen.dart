import 'package:flutter/material.dart';

import '../routes.dart';
import '../theme/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 2,
            center: Alignment(-0.7, -0.6),
            colors: [AppColors.forest, AppColors.slate],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    const Spacer(flex: 3),
                    Image.asset('assets/images/logo.png', height: 160),
                    const SizedBox(height: 16),
                    const Text(
                      'Reddit583',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(flex: 4),
                    FilledButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.signUp),
                      child: const Text('Get Started'),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text(
                          'Already a member?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, Routes.login),
                          child: const Text('Sign in'),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
