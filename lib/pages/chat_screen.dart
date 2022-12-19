import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({super.key, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  
  void _handledSubmit(String text){

    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 700),
        vsync: this),
      name: widget.name);

    setState(() {
      _messages.insert(0, message);
    });
    
    message.animationController.forward();
  }

  Widget _buildTextComposer(){
    return IconTheme(
    data: IconThemeData(color: Theme.of(context).colorScheme.secondary),  
    child: Row(
      children:<Widget>[
          Flexible(child: TextField(controller: _textController,)),
          IconButton(
            onPressed: (() => _handledSubmit(_textController.text)),
            icon: const Icon(Icons.send))
        ],
      )
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
          Flexible(
            child:  ListView.builder(
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          const Divider(height: 1.0),
          Container(
            child: _buildTextComposer(),
          )
        ],
      )
    );
  }
}

class ChatMessage extends StatelessWidget {

  const ChatMessage({super.key, required this.text,required this.animationController,required this.name});
  final String text;
  final AnimationController animationController;
  final String name; 


  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,  
        curve: Curves.easeOut),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Text(name[0]),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(name),
                Text(text)
              ],
            )
          )
        ],
      ),
    );
  }
}