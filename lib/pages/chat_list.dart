import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart';
import 'package:whatsapp_clone/pages/contacts.dart'; 
import 'dart:math';

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
              leading: Container(
                padding: const EdgeInsets.all(1.5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(messageData[i].imageUrl,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text(messageData[i].name,
                style: const TextStyle(fontWeight: FontWeight.bold),  
              ),
                Text(messageData[i].timeNow,
                style: const TextStyle(color: Colors.grey, fontSize: 14.0)
              )
              ]),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    messageData[i].send,
                    Expanded(
                      child: Text(messageData[i].newMessage,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: (() {
                var router = MaterialPageRoute(
                  builder: ((context) => ChatScreen(
                      name: messageData[i].name,
                      imageUrl: messageData[i].imageUrl,
                      index: i,
                    )
                  )
                );
                Navigator.of(context).push(router);
              }
            ))
          ]
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Transform.rotate(
          angle: pi / 1,
          child: const Icon(
            Icons.message,
            color: Colors.white
          ),
        ),
        onPressed: (){
          var router = MaterialPageRoute(
          builder: (context) => const Contacts());
          Navigator.of(context).push(router);
        }
      ),
    );
  }
}