import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';

class ChatMessage extends StatelessWidget {

  const ChatMessage({
    super.key,
    required this.text,
    required this.animationController,
    required this.name,
    required this.imageUrl,
    required this.timeNow
  });

  final String text;
  final AnimationController animationController;
  final String name; 
  final String imageUrl;
  final String timeNow;


  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,  
        curve: Curves.easeOut
      ),
      child: Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(top: 10, left: 40, right:  10),
        child: ClipPath(
          clipper: UpperNipMessageClipperTwo(MessageType.send),
          child: Container(
            padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10, right:  20),
            decoration: const BoxDecoration(
              color: Color(0XFFE4FDCA),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(text,
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Row(
                    children: [
                      Text(timeNow,
                        style: const TextStyle(
                          fontSize: 10.0
                        )
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.done_all,
                        size: 15,
                        color: Colors.blue,
                      ),
                    ],
                  )
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}