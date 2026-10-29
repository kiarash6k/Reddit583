import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// "Or continue with" divider followed by social sign-in buttons.
class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'or continue with',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialButton(
              label: 'Twitter',
              icon: FontAwesomeIcons.twitter,
              color: const Color(0xFF1DA1F2),
              onPressed: onPressed,
            ),
            const SizedBox(width: 16),
            _SocialButton(
              label: 'Apple',
              icon: FontAwesomeIcons.apple,
              color: Colors.black,
              onPressed: onPressed,
            ),
            const SizedBox(width: 16),
            _SocialButton(
              label: 'Google',
              icon: FontAwesomeIcons.google,
              color: const Color(0xFFDB4437),
              onPressed: onPressed,
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final String label;
  final FaIconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Continue with $label',
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: SizedBox(
            width: 56,
            height: 48,
            child: Center(child: FaIcon(icon, color: Colors.white, size: 20)),
          ),
        ),
      ),
    );
  }
}
