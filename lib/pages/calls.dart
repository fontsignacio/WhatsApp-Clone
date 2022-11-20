import 'package:flutter/material.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Icon(Icons.call_sharp,size: 170.0,color: Colors.blueAccent),
        Text("Calls")
      ],
    );
  }
}