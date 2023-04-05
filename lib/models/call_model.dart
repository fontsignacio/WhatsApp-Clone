import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';

class StatusModel {
  final String imgUrl;
  final String name; 
  final String time;
  final Widget calltype;
  final Icon icon;

  StatusModel({required this.imgUrl,required this.name,required this.time,required this.calltype , required this.icon});
}

List<StatusModel> calls = [

    StatusModel(
    name: messageData[5].name,
    time: "Today, 12:25",
    imgUrl: messageData[5].imageUrl,
    calltype: const Icon(Icons.call_received_sharp, color: Colors.red, size: 15),
    icon: const Icon(Icons.call, color: Color.fromARGB(255, 0, 128, 106)) 
  ),
  StatusModel(
    name: messageData[1].name,
    time: "Today, 10:52",
    imgUrl: messageData[1].imageUrl,
    calltype: const Icon(Icons.call_made_sharp, color: Colors.green, size: 15), 
    icon: const Icon(Icons.videocam_rounded, color: Color.fromARGB(255, 0, 128, 106)) 
  ),
  StatusModel(
    name: messageData[0].name,
    time: "Yesterday, 10:40",
    imgUrl: messageData[0].imageUrl,
    calltype: const Icon(Icons.call_made_sharp, color: Colors.green, size: 15), 
    icon: const Icon(Icons.videocam_rounded, color: Color.fromARGB(255, 0, 128, 106),) 
  ),
  StatusModel(
    name: messageData[0].name,
    time: "(2) Yesterday, 4:50",
    imgUrl: messageData[0].imageUrl, 
    calltype: const Icon(Icons.call_received_sharp, color: Colors.red, size: 15),
    icon: const Icon(Icons.call, color: Color.fromARGB(255, 0, 128, 106),) 
  ),
  StatusModel(
    name: messageData[3].name,
    time: "(2) December 12, 9:30",
    imgUrl: messageData[3].imageUrl,
    calltype: const Icon(Icons.call_received_sharp, color: Colors.red, size: 15), 
    icon: const Icon(Icons.videocam_rounded, color: Color.fromARGB(255, 0, 128, 106),) 
  ),
  StatusModel(
    name: messageData[3].name,
    time: "December 11, 4:55",
    imgUrl: messageData[3].imageUrl,
    calltype: const Icon(Icons.call_made_sharp, color: Colors.green, size: 15), 
    icon: const Icon(Icons.call, color: Color.fromARGB(255, 0, 128, 106),) 
  ),
  StatusModel(
    name: messageData[4].name,
    time: "December 9, 3:40",
    imgUrl: messageData[4].imageUrl, 
    calltype: const Icon(Icons.call_made_sharp, color: Colors.green, size: 15),
    icon: const Icon(Icons.videocam_rounded, color: Color.fromARGB(255, 0, 128, 106),) 
  ),

  
];