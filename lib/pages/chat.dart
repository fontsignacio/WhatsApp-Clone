import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Icon(Icons.mark_chat_read,size: 170.0,color: Colors.blueAccent),
        Text("Chat")
      ],
    );
  }
}