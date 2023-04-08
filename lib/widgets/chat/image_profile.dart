import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key, required this.index});
  final String index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.asset(index,
          fit: BoxFit.contain,
          scale: 1,
          height: 600,
        ),
      ),
    );
  }
}