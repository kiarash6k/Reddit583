import 'package:flutter/material.dart';

import '../routes.dart';
import '../utils/validators.dart';
import '../widgets/app_text_field.dart';
import '../widgets/auth_layout.dart';
import '../widgets/social_login_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _confirm.dispose();
    super.dispose();
  }

  void _enterApp() => Navigator.pushReplacementNamed(context, Routes.home);

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Welcome, ${_username.text.trim()}!')),
    );
    _enterApp();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: 'Create a new account',
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
                validator: Validators.username,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _email,
                label: 'Email',
                icon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validators.email,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _password,
                label: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
                textInputAction: TextInputAction.next,
                validator: Validators.password,
              ),
              const SizedBox(height: 16),
              AppTextField(
                controller: _confirm,
                label: 'Confirm password',
                icon: Icons.lock_outline,
                isPassword: true,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
                validator: Validators.matches(() => _password.text),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        FilledButton(onPressed: _submit, child: const Text('Create account')),
        const SizedBox(height: 24),
        SocialLoginSection(onPressed: _enterApp),
        const SizedBox(height: 24),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text('Already have an account?'),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, Routes.login),
              child: const Text('Login'),
            ),
          ],
        ),
      ],
    );
  }
}
