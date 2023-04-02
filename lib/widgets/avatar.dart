import 'package:flutter/material.dart';
import '../main.dart';

class Avatar extends StatelessWidget {
  final String imageUrl;
  const Avatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          var router = MaterialPageRoute(
          builder: (context) => const MyApp()); 
          Navigator.of(context).push(router);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              const Icon(Icons.arrow_back),
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(imageUrl),
              ),
          ], 
        ),
    );
  }
}