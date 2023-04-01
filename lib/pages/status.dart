import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/status_model.dart';
import 'package:whatsapp_clone/pages/camera.dart';
import 'package:whatsapp_clone/pages/chat_screen.dart';


class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {

  var myimage= NetworkImage(mystatus[0].imgUrl);
  var myname = Text(mystatus[0].name,
              style: const TextStyle(fontWeight: FontWeight.bold)
              );
  var mytime = Text(mystatus[0].time,
              style: const TextStyle(color: Colors.grey, fontSize: 15.0),
              );

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: ListView(
        children: <Widget>[ 
          ListTile(
            leading: CircleAvatar(
              radius: 26,
              child: CircleAvatar(
                backgroundImage: myimage,
                radius: 26,
                child: Container(
                  padding: const EdgeInsets.only(left: 26,top: 26),
                  width: 60, 
                  height: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60 / 2),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add_circle,
                        color: Color.fromARGB(255, 37, 211, 102),
                        size: 26
                      ),
                    )
                  ),
                ),
              )
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                myname
              ]
            ),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: mytime
            ), 
            onTap: () {
              var router = MaterialPageRoute(
              builder: (context) => const Camera());
              Navigator.of(context).push(router);
            }
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text("Recent updates", 
            style: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
          const SizedBox(height: 5),
        for(int i = 0; i<=2 ; i++)
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: const Color.fromARGB(255, 37, 211, 102), width: 3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Image.network(status[i].imgUrl,
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(status[i].name,
                style: const TextStyle(fontWeight: FontWeight.bold)
                )
              ]
            ),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(status[i].time,
              style: const TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),

            onTap: () {
              var router = MaterialPageRoute(
              builder: (context) => Images(name: status[i].name,
                  imgUrl: status[i].imgUrl,
                  time: status[i].time,
                  index: i
                )
              );
              Navigator.of(context).push(router);
            }
          
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text("Viewed updates", 
            style: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
          const SizedBox(height: 5),
        for(int i = 3; i<=4 ; i++)
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: Colors.grey, width: 3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(26),
                child: Image.network(status[i].imgUrl,
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text(status[i].name,
              style: const TextStyle(fontWeight: FontWeight.bold),  
            ),
            ]),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(status[i].time,
              style: const TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
            onTap: () {
              var router = MaterialPageRoute(
              builder: (context) => Images(name: status[i].name,
                imgUrl: status[i].imgUrl,
                time: status[i].time,
                index: i,
              )
            );
              Navigator.of(context).push(router);
            }
          )
        ]
      ),
          
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.camera_alt_rounded, color: Colors.white,),
        onPressed: (){
          var router = MaterialPageRoute(
          builder: (context) => const Camera()); 
          Navigator.of(context).push(router);
        }

      )
    );
  }
}
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
                      child: Image.network(widget.imgUrl,
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
                child: Image.network(widget.imgUrl,
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