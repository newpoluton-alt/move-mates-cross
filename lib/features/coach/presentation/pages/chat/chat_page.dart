import 'package:flutter/material.dart';

import '../coach_main_page.dart';

class ChatPage extends StatefulWidget implements CoachPage{
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();

  @override
  String pageNameValue() {
  return pageName;
  }

  static const String pageName = 'Чаты';
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(children: [SizedBox()],);
  }
}
