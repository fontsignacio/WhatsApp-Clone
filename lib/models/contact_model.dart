import 'package:whatsapp_clone/models/chat_model.dart';

class StatusModel {
  final String imgUrl;
  final String name; 
  final String status;

  StatusModel({required this.imgUrl,required this.name,required this.status});
}

List<StatusModel> contact = [
  StatusModel(
    name: messageData[0].name,
    status: "Hey there! I am using WhatsApp",
    imgUrl: messageData[0].imageUrl 
  ),
  StatusModel(
    name: messageData[1].name,
    status: "Hey there! I am using WhatsApp",
    imgUrl: messageData[1].imageUrl 
  ),
  StatusModel(
    name: messageData[2].name,
    status: "Hey there! I am using WhatsApp",
    imgUrl: messageData[2].imageUrl 
  ),
  StatusModel(
    name: messageData[3].name,
    status: "Hey there! I am using WhatsApp",
    imgUrl: messageData[3].imageUrl 
  ),
  StatusModel(
    name: messageData[4].name,
    status: "Hey there! I am using WhatsApp",
    imgUrl: messageData[4].imageUrl 
  ),
  StatusModel(
    name: messageData[5].name,
    status: "Hey there! I am using WhatsApp",
    imgUrl: messageData[5].imageUrl 
  ),
  StatusModel(
    name: messageData[6].name,
    status: "Hey there! I am using WhatsApp",
    imgUrl: messageData[6].imageUrl 
  ),
];