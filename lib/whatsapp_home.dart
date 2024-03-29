import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/home/call/calls.dart';
import 'package:whatsapp_clone/pages/home/camera/camera.dart';
import 'package:whatsapp_clone/pages/menu/broadcast.dart';
import 'package:whatsapp_clone/pages/home/chat/chat_list.dart';
import 'package:whatsapp_clone/pages/home/status/status.dart';
import 'package:whatsapp_clone/pages/menu/group.dart';
import 'package:whatsapp_clone/pages/menu/settings/settings.dart';
import 'package:whatsapp_clone/widgets/chat/search_chats.dart';

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
    double width = MediaQuery.of(context).size.width;
    double yourWidth = width  / 5;

    return Scaffold(
      appBar: AppBar(
          title: const Text("WhatsApp"),

          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchChats(),
                ));
              } 
            ),         
            PopupMenuButton <MenuItem> (
              onSelected: (value) => {
                if(value == MenuItem.item1){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Group(),
                  )),
                },
                if(value == MenuItem.item2){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Broadcast(),
                  )),
                },
                if(value == MenuItem.item5){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Settings(),
                  )),
                }
              },
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: MenuItem.item1,
                  child: Text("New group", style: TextStyle(fontSize: 13)),
                ),
                PopupMenuItem(
                  value: MenuItem.item2,
                  child: Text("New broadcast", style: TextStyle(fontSize: 13),),
                ),
                PopupMenuItem(
                  value: MenuItem.item3,
                  child: Text("Linked devices", style: TextStyle(fontSize: 13),),
                ),
                PopupMenuItem(
                  value: MenuItem.item4,
                  child: Text("Starred messages", style: TextStyle(fontSize: 13),),
                ),
                PopupMenuItem(
                  value: MenuItem.item5,
                  child: Text("Settings", style: TextStyle(fontSize: 13),),
                ) 
              ]  
            )            
          ],
          
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: <Widget>[
              Container(
                width: 30,
                height: 50,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.camera_alt_rounded,
                ),
              ),
              Container(
                width: yourWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text("CHATS", overflow: TextOverflow.ellipsis,)),
              Container(
                  width: yourWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: const  Text("STATUS", overflow: TextOverflow.ellipsis,)),
              Container(
                  width: yourWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text("CALL", overflow: TextOverflow.ellipsis,))
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

