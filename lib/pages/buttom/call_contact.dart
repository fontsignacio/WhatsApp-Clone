import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/contact_model.dart';
import 'package:whatsapp_clone/pages/home/chat/chat_screen.dart'; 

enum MenuItem {item1,item2,item3,item4}

class CallContact extends StatefulWidget {
  const CallContact({super.key});

  @override
  State<CallContact> createState() => _ContactsState();
}

class _ContactsState extends State<CallContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Positioned(
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text("Select Contact ",
                    style: TextStyle(fontWeight: FontWeight.bold
                  )
                )
              )
            ),
            Positioned(
              child: Container(
                padding: const EdgeInsets.only(top: 25),
                child: Text("${contact.length.toString()} contacts",
                  style: const TextStyle(color: Colors.white, fontSize: 13.0)
                )
              )
            ),
          ],
        ),
        actions: [
            const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(Icons.search),
            ),
            PopupMenuButton <MenuItem> (
              onSelected: (value) => {},
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: MenuItem.item1,
                  child: Text("Invite a friend          ", style: TextStyle(fontSize: 13)),
                ),
                PopupMenuItem(
                  value: MenuItem.item2,
                  child: Text("CallContact          ", style: TextStyle(fontSize: 13),),
                ),
                PopupMenuItem(
                  value: MenuItem.item3,
                  child: Text("Refresh          ", style: TextStyle(fontSize: 13),),
                ),
                PopupMenuItem(
                  value: MenuItem.item4,
                  child: Text("Help          ", style: TextStyle(fontSize: 13),),
                ),
              ]  
            )            
          ],
      ),
      body: Column(
        children: [     
          Flexible(
            child: ListView.builder(
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
                    trailing: Container(
                      width: 70,
                      margin: const EdgeInsets.only(right: 15),
                      child: Stack(
                        children: const [
                          Positioned(
                            child: Icon(Icons.call, color: Color.fromARGB(255, 0, 128, 106),),
                          ),
                          Positioned(
                            left: 50,
                            child: Icon(Icons.videocam_rounded, color: Color.fromARGB(255, 0, 128, 106),),
                          ),
                        ],
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
          ),
        ],
      ),
    );
  }
}