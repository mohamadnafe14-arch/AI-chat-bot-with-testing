import 'package:flutter/material.dart';

import 'screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFAFAFC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3568F5),
          surface: const Color(0xFFFAFAFC),
        ),
        fontFamily: 'Roboto',
      ),
      home: const ChatScreen(),
    );
  }
}
