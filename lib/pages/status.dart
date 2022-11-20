import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Icon(Icons.photo_sharp,size: 170.0,color: Colors.blueAccent),
        Text("Status")
      ],
    );
  }
}