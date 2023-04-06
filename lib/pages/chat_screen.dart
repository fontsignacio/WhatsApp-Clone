import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:whatsapp_clone/pages/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/profile.dart';
import '../widgets/message.dart';
import 'package:intl/intl.dart';
import '../widgets/avatar.dart';

enum MenuItem {item1,item2,item3,item4,item5,item6,item7}

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
      data.send = const Padding(
        padding: EdgeInsets.only(right: 3),
        child: Icon(Icons.done_all,size: 20,color: Colors.blue),
      );
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
                      prefixIcon: const Icon(
                        Icons.insert_emoticon,
                        size: 30,
                        color: Colors.grey
                      ),
                      hintText: "Message",
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
                        mainAxisSize: MainAxisSize.min, // added line
                        children: <Widget>[
                          Transform.rotate(
                            angle: 180,
                            child: const Icon(
                              Icons.attachment_outlined,
                              size: 30, 
                              color: Colors.grey
                            ),
                          ),
                          IconButton(                
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              size: 30,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              var router = MaterialPageRoute(
                              builder: (context) => const Camera()); 
                              Navigator.of(context).push(router);
                            },
                          ),
                        ],
                      ),               
                      focusColor: Colors.grey,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                )
              ),
            ),
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
        title: GestureDetector(
          onTap: (){
            var router = MaterialPageRoute(
            builder: (context) => Profile(index: widget.index,)); 
            Navigator.of(context).push(router);
          },
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10),
                    child: Text(widget.name,
                      style: const TextStyle(fontWeight: FontWeight.bold
                    )
                  )
                ),
              ),
              Positioned(
                child: Container(
                  padding: const EdgeInsets.only(top: 25),
                  child: const  Text("online",
                  style: TextStyle(color: Colors.white, fontSize: 13.0))
                ),
              )     
            ],
          ),
        ),
        actions: [
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.videocam_rounded),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(Icons.call),
            ),
            PopupMenuButton <MenuItem> (
              onSelected: (value) => {
                if(value == MenuItem.item1){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(index: widget.index),
                  )),
                },
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: MenuItem.item1,
                  child: Text("View contact", style: TextStyle(fontSize: 13)),
                ),
                const PopupMenuItem(
                  value: MenuItem.item2,
                  child: Text("Media, links, and docs", style: TextStyle(fontSize: 13),),
                ),
                const PopupMenuItem(
                  value: MenuItem.item3,
                  child: Text("Search", style: TextStyle(fontSize: 13),),
                ),
                const PopupMenuItem(
                  value: MenuItem.item4,
                  child: Text("Mute notifications", style: TextStyle(fontSize: 13),),
                ),
                const PopupMenuItem(
                  value: MenuItem.item5,
                  child: Text("Disappearing messages", style: TextStyle(fontSize: 13),),
                ),
                const PopupMenuItem(
                  value: MenuItem.item6,
                  child: Text("Wallpaper", style: TextStyle(fontSize: 13),),
                ),
                PopupMenuItem(
                  value: MenuItem.item7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("More", style: TextStyle(fontSize: 13),),
                      Icon(Icons.arrow_right, color: Colors.black,)
                    ],
                  ),
                ), 
              ]  
            )            
        ],
      ),
      body: Container(
        decoration: const  BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper.jpg"),
            fit: BoxFit.fitWidth
          )
        ),
        child: Column(
          children: <Widget>[ 
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const  Color.fromRGBO(212,235,244,1),
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10
                  )
                ]
              ),
              child: const Text(
                "Today",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
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
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 54, left: 5),
                    child: const  Icon(Icons.lock, size: 15),
                  ),
                  const Expanded(
                    child: Text(
                    "Messages and calls are end-to-end encrypted. No one outside of this chat, not even WhatsApp, can read or listen to them. Tap to learn more.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),)
                ],
              )
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
                padding: const EdgeInsets.only(left: 5, bottom: 270),
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
