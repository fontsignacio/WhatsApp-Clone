import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/contact_model.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart'; 

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Select Contact "),
      ),
      body: ListView.builder(
        itemCount: contact.length,
        itemBuilder:(context, i) => Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(1.5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(contact[i].imgUrl,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text(contact[i].name,
                style: const TextStyle(fontWeight: FontWeight.bold),  
              )]),
              subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(contact[0].status,
              style: const TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ), 
              onTap: (() {
                var router = MaterialPageRoute(
                  builder: ((context) => ChatScreen(name: contact[i].name,
                      imageUrl: contact[i].imgUrl,
                      index: i,
                    )
                  )
                );
                  Navigator.of(context).push(router);
              })
            )
          ]
        ),
      ),
    );
  }
}