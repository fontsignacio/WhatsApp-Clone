import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';


class ChatScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  const ChatScreen({super.key, required this.name, required this.imageUrl});

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
      name: widget.name,
      imageUrl: widget.imageUrl
    
    );

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
            decoration:const  InputDecoration.collapsed(hintText: "Message"),
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
        title: Avatar(name: widget.name, imageUrl: widget.imageUrl),
        
        actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.videocam_rounded),
            ),

            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.call),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.more_vert),
            ),
        ],
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

  const ChatMessage({
    super.key,
    required this.text,
    required this.animationController,
    required this.name,
    required this.imageUrl
  });

  final String text;
  final AnimationController animationController;
  final String name; 
  final String imageUrl;


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
                backgroundImage: NetworkImage(imageUrl),
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

class Avatar extends StatelessWidget {
  final String name;
  final String imageUrl;
  const Avatar({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(imageUrl),
          ),
          Text(name),
        ],
      ),
    );
  }
}

