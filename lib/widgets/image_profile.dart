import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class ImageProfile extends StatelessWidget {
  const ImageProfile({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.asset(contact[index].imgUrl,
          fit: BoxFit.contain,
          scale: 1,
          height: 600,
        ),
      ),
    );
  }
}