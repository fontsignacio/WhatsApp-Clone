import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({super.key, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();

  Widget _buildTextComposer(){
    return Row(
      children:<Widget>[
        Flexible(child: TextField(controller: _textController,))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: _buildTextComposer(),
          )
        ],
      )
    );
  }
}