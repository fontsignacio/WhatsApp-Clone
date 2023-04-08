import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/status_model.dart';
import 'package:whatsapp_clone/pages/home/camera/camera.dart';
import '../../../widgets/status/images_status.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {

  var myimage= AssetImage(mystatus[0].imgUrl);
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
              radius: 23,
              child: CircleAvatar(
                backgroundImage: myimage,
                radius: 23,
                child: Container(
                  padding: const EdgeInsets.only(left: 25,top: 25),
                  width: 60, 
                  height: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60 / 2),                      
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add_circle,
                        color: Color.fromARGB(255, 0, 128,106),
                        size: 22
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
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: const Color.fromARGB(255, 0,230,118), width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(status[i].imgUrl,
                  height: 40,
                  width: 40,
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
              builder: (context) => Images(index: i));
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
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(status[i].imgUrl,
                  height: 40,
                  width: 40,
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
              builder: (context) => Images(index: i));
              Navigator.of(context).push(router);
            }
          )
        ]
      ),
          
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
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