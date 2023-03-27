import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
  final photos = [];

  return Scaffold(
      body: CameraCamera(
        onFile: (file) {
          photos.add(file);
          var router = MaterialPageRoute(
          builder: (context) => Image.file(file));
          Navigator.of(context).push(router); 
        },
      )
    );
  }
}