class ChatModel{
  final String name;
  String message;
  final String time;
  final String imageUrl;
  late String newMessage; 
  late String timeNow;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    required this.newMessage,
    required this.timeNow,
  });
}

List<ChatModel> messageData = [
  ChatModel(
    name: "Juan Perez",
    message: "Hi bro",
    time: "15:30",
    imageUrl: "assets/images/photo2.jpg",
    newMessage: "Hi bro",
    timeNow: "15:30"
  ),
  ChatModel(
    name: "Jacinto Pedraza",
    message: "My boy are you good?",
    time: "14:30",
    imageUrl: "assets/images/photo3.jpg",
    newMessage: "My boy are you good?",
    timeNow: "15:30"
  ),
  ChatModel(
    name: "Jose Maria Gomez",
    message: "You're the king of the football",
    time: "19:50",
    imageUrl: "assets/images/photo8.jpg",
    newMessage: "You're the king of the football",
    timeNow: "15:30"
  ),
  ChatModel(
    name: "Ernesto Sales",
    message: "Could you do the homework?",
    time: "14:38",
    imageUrl: "assets/images/photo4.jpg",
    newMessage: "Could you do the homework?",
    timeNow: "15:30"
  ),
  ChatModel(
    name: "Edmundo Loandos",
    message: "How I can Help?",
    time: "12:30",
    imageUrl: "assets/images/photo5.jpg",
    newMessage: "How I can Help?",
    timeNow: "15:30"
  ),
  ChatModel(
    name: "Juan Sierra",
    message: "Are you ok? friend",
    time: "04:30",
    imageUrl: "assets/images/photo6.jpg",
    newMessage: "Are you ok? friend",
    timeNow: "15:30"

  ),
  ChatModel(
    name: "German Ramirez",
    message: "Hello",
    time: "13:12",
    imageUrl: "assets/images/photo7.jpg",
    newMessage: "Hello",
    timeNow: "15:30"
  ),

];