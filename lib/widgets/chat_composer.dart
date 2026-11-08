import 'package:flutter/material.dart';

class ChatComposer extends StatelessWidget {
  const ChatComposer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 14),
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAFC),
        border: Border(top: BorderSide(color: Color(0xFFEFEFF2))),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 11, 10, 11),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE6E7EC)),
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0A20212A),
                  blurRadius: 12,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Row(
              children: [
                Expanded(
                  child: Text(
                    'Message ChatGPT...',
                    style: TextStyle(color: Color(0xFFA1A2AC), fontSize: 14),
                  ),
                ),
                Icon(
                  Icons.add_circle_outline_rounded,
                  color: Color(0xFF858691),
                  size: 22,
                ),
                SizedBox(width: 13),
                Icon(
                  Icons.mic_none_rounded,
                  color: Color(0xFF858691),
                  size: 22,
                ),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Color(0xFF3568F5),
                  child: Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.white,
                    size: 19,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 9),
          const Text(
            'ChatGPT can make mistakes. Check important info.',
            style: TextStyle(color: Color(0xFF9A9AA4), fontSize: 10),
          ),
        ],
      ),
    );
  }
}
