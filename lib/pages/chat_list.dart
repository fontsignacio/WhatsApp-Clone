import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart';
import 'package:whatsapp_clone/pages/contacts.dart'; 

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: messageData.length,
        itemBuilder:(context, i) => Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(messageData[i].imageUrl),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text(messageData[i].name,
                style: const TextStyle(fontWeight: FontWeight.bold),  
              ),
                Text(messageData[i].time,
                style: const TextStyle(color: Colors.grey, fontSize: 14.0)
              )
              ]),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(messageData[i].message,
                style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
              onTap: (() {
                var router = MaterialPageRoute(
                  builder: ((context) => ChatScreen(name: messageData[i].name, imageUrl: messageData[i].imageUrl,)));
                  Navigator.of(context).push(router);
              }
            ))
          ]
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.message, color: Colors.white,),
        onPressed: (){
          var router = MaterialPageRoute(
            builder: (context) => const Contacts());
            Navigator.of(context).push(router);
        }
      ),
    );
  }
}