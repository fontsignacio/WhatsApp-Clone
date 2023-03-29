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
              child: CircleAvatar(
                backgroundImage: myimage,
                radius: 22,

                child: Container(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  width: 60, 
                  height: 60,
                  child: Container(
                  padding: const EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60 / 2),
                  ),
                    child: const Center(
                      child: Icon(Icons.add_circle,color: Color.fromARGB(255, 37, 211, 102), size: 20),
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
          
          Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text("\nRecent updates\n", 
            style: TextStyle(color: Colors.grey, fontSize: 15)),
          ),

        for(int i = 0; i<=2 ; i++)
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 37, 211, 102),
              radius: 22,           
              child: CircleAvatar(
                backgroundImage: NetworkImage(status[i].imgUrl), 
                radius: 20,               
              )
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
              builder: (context) => Images(name: status[i].name,imgUrl: status[i].imgUrl, time: status[i].time));
              Navigator.of(context).push(router);
            }
          
          ),

          Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text("\nViewed updates\n", 
            style: TextStyle(color: Colors.grey, fontSize: 15)),
          ),

        for(int i = 3; i<=4 ; i++)
          ListTile(
            leading: CircleAvatar(
              child: CircleAvatar(
                backgroundImage: NetworkImage(status[i].imgUrl), 
                radius: 22.0,               
              )
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
              builder: (context) => Images(name: status[i].name,imgUrl: status[i].imgUrl, time: status[i].time));
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

class Images extends StatelessWidget {
  const Images({
    super.key,
    required this.name,
    required this.imgUrl,
    required this.time
  });
  final String imgUrl;
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl), 
                  radius: 22.0,               
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text(name,
                style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),  
              ),
              ]),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(time,
                style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),

              onTap: () {
                var router = MaterialPageRoute(
                builder: (context) => ChatScreen(name: name, imageUrl: imgUrl));
                Navigator.of(context).push(router);
              }
            ),
          backgroundColor: Colors.black
        ),
        body:  Center(
          child: Image.network(imgUrl),
        ),
        backgroundColor: Colors.black,
      )
    );
  }
}