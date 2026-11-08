import 'package:flutter/material.dart';

import '../widgets/assistant_message.dart';
import '../widgets/chat_composer.dart';
import '../widgets/chat_header.dart';
import '../widgets/user_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ChatHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                children: const [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Text(
                        'Today',
                        style: TextStyle(
                          color: Color(0xFF9A9AA4),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  UserMessage(
                    text: 'Can you explain how artificial intelligence works?',
                  ),
                  SizedBox(height: 20),
                  AssistantMessage(
                    text:
                        'Artificial intelligence (AI) helps computers learn '
                        'from information and solve problems that usually '
                        'require human thinking.\n\n'
                        'It finds patterns in data, uses them to make '
                        'predictions, and can improve as it learns.',
                  ),
                  SizedBox(height: 20),
                  UserMessage(
                    text: 'What are some examples I might use every day?',
                  ),
                  SizedBox(height: 20),
                  AssistantMessage(
                    text:
                        'You probably use AI more often than you think:\n\n'
                        '• Voice assistants and smart speakers\n'
                        '• Movie and music recommendations\n'
                        '• Maps that predict traffic\n'
                        '• Photo filters and spam detection',
                  ),
                ],
              ),
            ),
            const ChatComposer(),
          ],
        ),
      ),
    );
  }
}
