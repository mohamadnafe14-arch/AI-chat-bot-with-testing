import 'package:flutter/material.dart';

class BotAvatar extends StatelessWidget {
  const BotAvatar({super.key, this.size = 34});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFFEAF0FF),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.smart_toy_rounded,
        color: const Color(0xFF3568F5),
        size: size * 0.58,
      ),
    );
  }
}
