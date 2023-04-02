import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart';

class Images extends StatefulWidget {
  const Images({
    super.key,
    required this.name,
    required this.imgUrl,
    required this.time,
    required this.index
  });
  final String imgUrl;
  final String name;
  final String time;
  final int index;


  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {
        
      });
    });
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pop();
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            LinearProgressIndicator(
              minHeight: 2, 
              value: controller.value,
              color: Colors.white,
              backgroundColor: Colors.grey,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: (() {
                    var router = MaterialPageRoute(
                    builder: (context) => ChatScreen(name: widget.name, imageUrl: widget.imgUrl, index: widget.index, ));
                    Navigator.of(context).push(router);
                  }),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 21,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.asset(widget.imgUrl,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  onPressed: (() {
                    var router = MaterialPageRoute(
                    builder: (context) => ChatScreen(name: widget.name, imageUrl: widget.imgUrl, index: widget.index,));
                    Navigator.of(context).push(router);
                  }),
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child:  Text(widget.name,
                            style: const TextStyle(color: Colors.grey, 
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                            ),  
                          )
                        
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child:  Text(widget.time,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13.0
                            ),
                          ),
                        
                      )
                    ],
                  )
                ),
              ],
            ),    
            SafeArea(
              child: GestureDetector(
                onTap: () {     
                  setState(() {
                    if (determinate == false) {
                        controller.stop();
                        determinate = true;
                      } else {
                        determinate = false;
                        controller
                          .forward(from: controller.value);
                    }
                  });
                },
                child: Image.asset(widget.imgUrl,
                  fit: BoxFit.contain,
                  scale: 1,
                  height: 600,
                ),
              )
            ), 
          ],
        ),
        backgroundColor: Colors.black,
      )
    );
  }
}