import 'package:whatsapp_clone/models/chat_model.dart';

class StatusModel {
  final String imgUrl;
  final String name; 
  final String time;

  StatusModel({required this.imgUrl,required this.name,required this.time});
}
List<StatusModel> status1 = [
  StatusModel(
    name: "My status",
    time: "Recent updates",
    imgUrl: "https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" 
  ),
];


List<StatusModel> status = [
  StatusModel(
    name: messageData[0].name,
    time: "Today, 3:00AM",
    imgUrl: messageData[0].imageUrl 
  ),
  StatusModel(
    name: messageData[1].name,
    time: "Today, 3:30AM",
    imgUrl: messageData[1].imageUrl 
  ),
  StatusModel(
    name: messageData[2].name,
    time: "Today, 4:00AM",
    imgUrl: messageData[2].imageUrl 
  ),
  StatusModel(
    name: messageData[3].name,
    time: "Today, 2:00AM",
    imgUrl: messageData[3].imageUrl 
  ),
  StatusModel(
    name: messageData[4].name,
    time: "Today, 3:00AM",
    imgUrl: messageData[4].imageUrl 
  ),
];