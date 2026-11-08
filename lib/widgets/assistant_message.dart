import 'package:flutter/material.dart';

import 'bot_avatar.dart';

class AssistantMessage extends StatelessWidget {
  const AssistantMessage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 2),
          child: BotAvatar(size: 28),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F1F5),
              borderRadius: BorderRadius.circular(18)
                  .copyWith(topLeft: const Radius.circular(5)),
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF343540),
                fontSize: 14,
                height: 1.55,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
