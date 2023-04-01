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
          builder: (context) =>
            SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                ),
                body:  Center(
                  child: Image.file(file,
                    fit: BoxFit.cover,
                    scale: 1,
                    height: 600
                  ),
                ),
                backgroundColor: Colors.black,
              )
            )
          );
          Navigator.of(context).push(router); 
        },
      )
    );
  }
}
