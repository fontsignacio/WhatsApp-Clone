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
    imageUrl: "https://images.unsplash.com/photo-1485206412256-701ccc5b93ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=894&q=80",
    newMessage: "Hi bro",
    timeNow: "15:30"
  ),
  ChatModel(
    name: "Jacinto Pedraza",
    message: "My boy are you good?",
    time: "14:30",
    imageUrl: "https://images.unsplash.com/photo-1485528562718-2ae1c8419ae2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=858&q=80",
    newMessage: "My boy are you good?",
    timeNow: "15:30"
  ),
  ChatModel(
    name: "Jose Maria Gomez",
    message: "You're the king of the football",
    time: "19:50",
    imageUrl: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    newMessage: "You're the king of the football",
    timeNow: "15:30"
  ),
  ChatModel(
    name: "Ernesto Sales",
    message: "Could you do the homework?",
    time: "14:38",
    imageUrl: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    newMessage: "Could you do the homework?",
    timeNow: "15:30"
  ),
  ChatModel(
    name: "Edmundo Loandos",
    message: "How I can Help?",
    time: "12:30",
    imageUrl: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    newMessage: "How I can Help?",
    timeNow: "15:30"
  ),
  ChatModel(
    name: "Juan Sierra",
    message: "Are you ok? friend",
    time: "04:30",
    imageUrl: "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    newMessage: "Are you ok? friend",
    timeNow: "15:30"

  ),
  ChatModel(
    name: "German Ramirez",
    message: "Hello",
    time: "13:12",
    imageUrl: "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    newMessage: "Hello",
    timeNow: "15:30"
  ),

];