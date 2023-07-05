import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});
  static const id = 'user_page';

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('user page'),
      ),
      body: const Column(children: [SizedBox()]),
    );
  }
}
