import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/main.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp_clone/pages/camera.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  final int index;
  const ChatScreen({super.key,
    required this.name,
    required this.imageUrl,
    required this.index,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  final String timeNow = DateFormat.Hm().format(DateTime.now());
  Widget iconsText = const Icon(Icons.send,color: Colors.white,size: 30); 
  Widget iconAudio = const Icon(Icons.mic,color: Colors.white,size: 30);
  Widget icon = const Icon(Icons.mic,color: Colors.white,size: 30);
  bool _isTyped = false;

  void _handledSubmit(String text){
    _textController.clear();

    setState(() {
      _isTyped = false;
      icon = iconAudio;
    });
    
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 700),
        vsync: this),
      name: widget.name,
      imageUrl: widget.imageUrl,
      timeNow: timeNow,
    );


    setState(() { 
      _messages.insert(0, message);
      var data = messageData.firstWhere((t) => t.name == widget.name);
      data.newMessage = message.text; 
      data.timeNow = timeNow;
    });
    
    message.animationController.forward();
  }

  Widget _buildTextComposer(){
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),  
      child: Row(
        children:<Widget>[
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxHeight: 100),
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
              child: Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.white),
                child: SingleChildScrollView(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 2,
                    controller: _textController,
                    onChanged: (String text) {
                      setState(() {
                        _isTyped = text.isNotEmpty;
                        if(_isTyped){
                          icon = iconsText;
                        }else{
                          icon = iconAudio;
                        }
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.insert_emoticon,size: 30, color: Colors.grey),
                      hintText: "Message",
                      suffixIcon: IconButton(                
                        icon: const Icon(Icons.camera_alt,
                          size: 30,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          var router = MaterialPageRoute(
                          builder: (context) => const Camera()); 
                          Navigator.of(context).push(router);
                        },
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      focusColor: Colors.grey,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                )
              ),
            )
          ),
          GestureDetector(
            onTap: _isTyped ? () => _handledSubmit(_textController.text) : null, 
            child: Container(
              padding: const EdgeInsets.all(10),
              margin:const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 7, 94, 84),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: icon
              )
            ),          
          ),
        ],
      )
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Avatar(imageUrl: widget.imageUrl),
        title: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(widget.name),
            ),
            Container(
              padding: const EdgeInsets.only(top: 25),
              child: const  Text("online",
              style: TextStyle(color: Colors.white70,fontStyle: FontStyle.italic, fontSize: 15.0))
            )     
          ],
        ),
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
      body: Container(
        decoration: const  BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://i.pinimg.com/originals/8f/ba/cb/8fbacbd464e996966eb9d4a6b7a9c21e.jpg"
            ),
            fit: BoxFit.fitWidth
          )
        ),
        child: Column(
          children: <Widget>[ 
            Container(
              width: 300,
              margin: const EdgeInsets.only(bottom: 20, top: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const  Color(0XFFFFF3C2),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 8
                  )
                ]
              ),
              child: const Text(
                "When you send messages or make calls using end-to-end encryption, the content is secure and can only be accessed by the intended recipient, ensuring privacy and security.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: ClipPath(
                clipper: UpperNipMessageClipperTwo(MessageType.receive),
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10,left: 25, right:  10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(messageData[widget.index].message,
                        style: const TextStyle(fontSize: 17),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(messageData[widget.index].time,
                        style: const TextStyle(fontSize: 10.0))
                      )
                    ],
                  )
                ),
              )        
            ),      
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 5, bottom: 0,left: 5, right:  0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            Container(
              child: _buildTextComposer(),
            )
          ],
        )
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
    required this.imageUrl,
    required this.timeNow
  });

  final String text;
  final AnimationController animationController;
  final String name; 
  final String imageUrl;
  final String timeNow;


  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,  
        curve: Curves.easeOut
      ),
      child: Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(top: 10, bottom: 0, left: 40, right:  10),
        child: ClipPath(
          clipper: UpperNipMessageClipperTwo(MessageType.send),
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10,left: 10, right:  20),
            decoration: const BoxDecoration(
              color: Color(0XFFE4FDCA),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Text(text,
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
                Container( 
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Row(
                    children: [
                      Text(timeNow,
                        style: const TextStyle(fontSize: 10.0)
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.done_all,
                        size: 15,
                        color: Colors.blue,
                      ),
                    ],
                  )
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final String imageUrl;
  const Avatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          var router = MaterialPageRoute(
          builder: (context) => const MyApp()); 
          Navigator.of(context).push(router);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              const Icon(Icons.arrow_back),
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(imageUrl),
              ),
          ], 
        ),
    );
  }
}