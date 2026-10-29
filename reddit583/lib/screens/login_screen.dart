import 'package:flutter/material.dart';

import '../routes.dart';
import '../utils/validators.dart';
import '../widgets/app_text_field.dart';
import '../widgets/auth_layout.dart';
import '../widgets/social_login_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  void _enterApp() => Navigator.pushReplacementNamed(context, Routes.home);

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Welcome back, ${_username.text.trim()}!')),
    );
    _enterApp();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Login',
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField(
                controller: _username,
                label: 'Username',
                icon: Icons.person_outline,
                textInputAction: TextInputAction.next,
                validator: (v) => Validators.notEmpty(v, 'Enter your username'),
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _password,
                label: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
                validator: (v) => Validators.notEmpty(v, 'Enter your password'),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content:
                      Text('Password reset is not available in this demo.')),
            ),
            child: const Text('Forgot password?'),
          ),
        ),
        const SizedBox(height: 8),
        FilledButton(onPressed: _submit, child: const Text('Log in')),
        const SizedBox(height: 24),
        SocialLoginSection(onPressed: _enterApp),
        const SizedBox(height: 24),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text('Not a member yet?'),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, Routes.signUp),
              child: const Text('Sign up'),
            ),
          ],
        ),
      ],
    );
  }
}
