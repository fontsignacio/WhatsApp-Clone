import 'package:flutter/material.dart';
import 'package:whatsapp_clone/whatsapp_home.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WhatsApp",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 7, 94, 84),
          secondary: const Color.fromARGB(255, 37, 211, 102)
        ),      
      ),
      debugShowCheckedModeBanner: false,
      home: const WhatsAppHome(),
    );
  }
}

