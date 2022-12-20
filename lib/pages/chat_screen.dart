import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  final String name; 
  const ChatScreen({super.key, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isTyped = false;

  void _handledSubmit(String text){
    _textController.clear();

    setState(() {
      _isTyped = false;
    });
    
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 700),
        vsync: this),
      name: widget.name);

    setState(() {
      _messages.insert(0, message);
      var data = messageData.firstWhere((t) => t.name == widget.name);
      data.message = message.text; 
    });
    
    message.animationController.forward();
  }

  Widget _buildTextComposer(){
    return IconTheme(
    data: IconThemeData(color: Theme.of(context).colorScheme.secondary),  
    child: Row(
      children:<Widget>[
          Flexible(child: TextField(
            controller: _textController,
            onChanged: (String text) {
              setState(() {
                _isTyped = text.isNotEmpty;
              });
            },
            decoration:const  InputDecoration.collapsed(hintText: "Enviar Mensaje"),
          )
        ),
          IconButton(
            onPressed: _isTyped ? () => _handledSubmit(_textController.text) : null, 
            icon: const Icon(Icons.send),
          )
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
              padding: const EdgeInsets.all(8.0),
              reverse: true,
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
      child: Container(
      margin:  const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
             margin: const EdgeInsets.only(right: 16.0),
             child: CircleAvatar(
                child: Text(name[0]),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name, style: Theme.of(context).textTheme.subtitle1),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            )
          )
        ],
      ),
      ),
    );
  }
}