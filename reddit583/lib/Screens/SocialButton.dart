import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButton extends StatelessWidget {
  final FaIconData icon;
  final Color color;
  final VoidCallback onPressed;

  const SocialButton(this.icon, this.color,
      {Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: SizedBox(
          width: 48,
          height: 48,
          child: Center(child: FaIcon(icon, color: Colors.white, size: 22)),
        ),
      ),
    );
  }
}

const twitterIcon = FontAwesomeIcons.twitter;
const appleIcon = FontAwesomeIcons.apple;
const googleIcon = FontAwesomeIcons.google;
