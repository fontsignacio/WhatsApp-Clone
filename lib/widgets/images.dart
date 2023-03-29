import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  const Images({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Image.network(imgUrl),
      ),
    );
  }
}