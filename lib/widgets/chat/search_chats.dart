
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/home/chat/chat_screen.dart';
import '../../models/chat_model.dart';

class SearchChats extends StatefulWidget {
  const SearchChats({super.key});

  @override
  State<SearchChats> createState() => _SearchContactState();
}

class _SearchContactState extends State<SearchChats> {
  TextEditingController searchController = TextEditingController();
  List<ChatModel> data = messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Search...",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          onChanged: (String text) {
            text = text.toLowerCase();
            setState(() {
              data = messageData.where((u) {
                var message = u.message.toLowerCase();
                var name = u.name.toLowerCase();
                return message.contains(text) || name.contains(text);
              }).toList();
            });
          }
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder:(context, i) => Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(1.5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(data[i].imageUrl,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text(data[i].name,
                style: const TextStyle(fontWeight: FontWeight.bold),  
              ),
                Text(data[i].timeNow,
                style: const TextStyle(color: Colors.grey, fontSize: 14.0)
              )
              ]),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    data[i].send,
                    Expanded(
                      child: Text(data[i].newMessage,
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
                      name: data[i].name,
                      imageUrl: data[i].imageUrl,
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
    );
  }
}