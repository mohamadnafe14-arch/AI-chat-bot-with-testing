import 'package:flutter/material.dart';

import 'bot_avatar.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAFC),
        border: Border(bottom: BorderSide(color: Color(0xFFEFEFF2))),
      ),
      child: Row(
        children: [
          const BotAvatar(size: 36),
          const SizedBox(width: 11),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ChatGPT',
                  style: TextStyle(
                    color: Color(0xFF20212A),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'AI Assistant',
                  style: TextStyle(
                    color: Color(0xFF92929D),
                    fontSize: 11,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.more_horiz_rounded,
            color: Color(0xFF777985),
            size: 25,
          ),
        ],
      ),
    );
  }
}
