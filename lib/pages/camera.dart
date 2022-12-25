import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});
  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: const <Widget>[
        Icon(Icons.camera_alt_outlined,size: 170.0,color: Colors.blueAccent),
        Text("Camara")
      ],
    );
  }
}