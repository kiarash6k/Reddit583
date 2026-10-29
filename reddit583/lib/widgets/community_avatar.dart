import 'package:flutter/material.dart';

/// Round avatar showing the community's first letter on a stable colour.
class CommunityAvatar extends StatelessWidget {
  const CommunityAvatar({super.key, required this.name, this.radius = 20});

  final String name;
  final double radius;

  static const _palette = [
    Color(0xFF1E88E5),
    Color(0xFF8E24AA),
    Color(0xFFD84315),
    Color(0xFF00897B),
    Color(0xFF5D4037),
    Color(0xFF3949AB),
  ];

  @override
  Widget build(BuildContext context) {
    final label = name.replaceFirst(RegExp(r'^r/'), '');
    final letter = label.isEmpty ? '?' : label[0].toUpperCase();
    final color = _palette[
        label.codeUnits.fold<int>(0, (a, b) => a + b) % _palette.length];
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: Text(
        letter,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: radius * 0.9,
        ),
      ),
    );
  }
}
