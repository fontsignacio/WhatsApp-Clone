class ChatModel{
  final String name;
  String message;
  final String time;
  final String imageUrl; 

  ChatModel({required this.name,required this.message,required this.time,required this.imageUrl});
}

List<ChatModel> myUser = [
  ChatModel(
    name: "Leonardo Valenzuela",
    message: "",
    time: "",
    imageUrl: "https://images.unsplash.com/photo-1530268729831-4b0b9e170218?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80" 
  ),
];

List<ChatModel> messageData = [
  ChatModel(
    name: "Juan Perez",
    message: "Hola bro",
    time: "15:30",
    imageUrl: "https://images.unsplash.com/photo-1485206412256-701ccc5b93ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=894&q=80"
  ),
  ChatModel(
    name: "Jacinto Pedraza",
    message: "Mi rey todo bien?",
    time: "14:30",
    imageUrl: "https://images.unsplash.com/photo-1485528562718-2ae1c8419ae2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=858&q=80"
  ),
  ChatModel(
    name: "Jose Maria Gomez",
    message: "Genio del Futbol Mundial",
    time: "19:50",
    imageUrl: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
  ),
  ChatModel(
    name: "Ernesto Sales",
    message: "Pudiste hacer el practico?",
    time: "14:38",
    imageUrl: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
  ),
  ChatModel(
    name: "Edmundo Loandos",
    message: "En que te puedo ayudar?",
    time: "12:30",
    imageUrl: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
  ),
  ChatModel(
    name: "Juan Sierra",
    message: "Todo bien amigo?",
    time: "04:30",
    imageUrl: "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
  ),
  ChatModel(
    name: "German Ramirez",
    message: "Holaaa",
    time: "13:12",
    imageUrl: "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"
  ),

];