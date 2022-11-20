import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/calls.dart';
import 'package:whatsapp_clone/pages/camera.dart';
import 'package:whatsapp_clone/pages/chat.dart';
import 'package:whatsapp_clone/pages/status.dart';

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
    controller = TabController(length: 4, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("WhatsApp"),
          bottom: TabBar(
            tabs: const <Widget>[
              Tab(icon: Icon(Icons.camera_alt_outlined)),
              Tab(text: "Chat"),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
          controller: controller,
        )
      ),
      body: TabBarView(
        // ignore: sort_child_properties_last
        children: const <Widget>[
          Camera(),Chat(),Status(),Calls()
        ],
        controller: controller,
      ),
    );
  } 
}

