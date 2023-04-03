import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart';
import 'package:whatsapp_clone/models/status_model.dart';
import 'package:whatsapp_clone/pages/status.dart';

class Images extends StatefulWidget {
  const Images({
    super.key,
    required this.index
  });
  final int index;


  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> with TickerProviderStateMixin {
  late AnimationController controller;
  bool determinate = false;
  late int index;

  @override
  void initState() {
    index = widget.index;

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {
        
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if(index == 4){
          Navigator.of(context).pop();
        }else{
          index++;
          controller.reset(); 
          controller.forward();
        }
      }     
    });

    controller.forward();
    super.initState();
  }

  void _startHold() {
    setState(() {
      if (determinate == false) {
        controller.stop();
        determinate = true;
      }
    });
  }

  void _endHold() {
    setState(() {
      if (determinate != false) {
          determinate = false;
          controller
            .forward(from: controller.value);
      }
    });
  }

  void _tap(){
    setState(() {
      if (index >= 0 && index < 4) {
        setState(() {
          index++;
        });
        var router = MaterialPageRoute(
        builder: (context) => Images(index: index));
        Navigator.pushReplacement(context, router);
      }
    });
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
                    builder: (context) => ChatScreen(
                      name: status[index].name,
                      imageUrl: status[index].imgUrl,
                      index: index
                    ));
                    Navigator.of(context).push(router);
                  }),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 21,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.asset(status[index].imgUrl,
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
                    builder: (context) => ChatScreen(
                      name: status[index].name,
                      imageUrl: status[index].imgUrl,
                      index: index
                    ));
                    Navigator.of(context).push(router);
                  }),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.53,
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child:  Text(status[index].name,
                                style: const TextStyle(color: Colors.grey, 
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                ),  
                              )
                            
                          ),
                        ),
                        Positioned(
                          child: Container(
                            padding: const EdgeInsets.only(top: 20),
                            child:  Text(status[index].time,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.0
                                ),
                              ),
                            
                          ),
                        ),
                      ],
                    ),
                  )
                ),                
                const Icon(Icons.more_vert, size: 25, color: Colors.white)
              ],
            ),    
            SafeArea(
              child: GestureDetector(
                onLongPress: _startHold,
                onLongPressUp: _endHold,
                onTap: _tap,
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  if (details.delta.dx > 0 && index > 0) {
                    setState(() {
                      index--;
                    });
                    var router = MaterialPageRoute(
                    builder: (context) => Images(index: index));
                    Navigator.pushReplacement(context, router);
                  } else if (details.delta.dx < 0 && index < 4) {
                    setState(() {
                      index++;
                    });
                    var router = MaterialPageRoute(
                    builder: (context) => Images(index: index));
                    Navigator.pushReplacement(context, router);
                  }
                },
                child: Image.asset(status[index].imgUrl,
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