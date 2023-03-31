import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/calls.dart';
import 'package:whatsapp_clone/pages/camera.dart';
import 'package:whatsapp_clone/pages/contacts.dart'; 
import 'package:whatsapp_clone/pages/chat_list.dart';
import 'package:whatsapp_clone/pages/status.dart';

enum MenuItem {item1,item2,item3,item4,item5}

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});
  
  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState(){
    super.initState();
    controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("WhatsApp"),

          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: PopupMenuButton <MenuItem> (
                onSelected: (value) => {
                  if(value == MenuItem.item1){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Contacts(),
                    )),
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: MenuItem.item1,
                    child: Text("New group"),
                  ),
                  PopupMenuItem(
                    value: MenuItem.item2,
                    child: Text("New broadcast"),
                  ),
                  PopupMenuItem(
                    value: MenuItem.item3,
                    child: Text("Linked devices"),
                  ),
                  PopupMenuItem(
                    value: MenuItem.item4,
                    child: Text("Starred messages"),
                  ),
                  PopupMenuItem(
                    value: MenuItem.item5,
                    child: Text("Settings"),
                  ) 
                ]  
              )
            )
          ],
          
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: const <Widget>[
              Tab(icon: Icon(Icons.camera_alt_rounded)),
              Tab(text: "CHAT"),
              Tab(text: "STATUS"),
              Tab(text: "CALLS"),
            ],
          controller: controller,
        )
      ),
      body: TabBarView(
        // ignore: sort_child_properties_last
        children: const <Widget>[
          Camera(),
          ChatList(),
          Status(),
          Calls()
        ],
        controller: controller,
      ),
    );
  } 
}

