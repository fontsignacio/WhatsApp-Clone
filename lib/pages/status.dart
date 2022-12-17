import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/status_model.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: ListView(
        children: <Widget>[ 

          ListTile(
            leading: CircleAvatar(
              child: CircleAvatar(
                backgroundImage: NetworkImage(mystatus[0].imgUrl),
                radius: 22.0,
                child: Container(
                  padding: const EdgeInsets.all(20.0),    
                  child: const Icon(Icons.add_circle,                 
                  color: Color.fromARGB(255, 37, 211, 102))
                )                                         
              )
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text(mystatus[0].name,
              style: const TextStyle(fontWeight: FontWeight.bold),  
            ),
            ]),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(mystatus[0].time,
              style: const TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),  
          ),
          Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text("Recent updates", 
            style: TextStyle(color: Colors.grey, fontSize: 15)),
          ),

          const Divider(
            height: 10.0, 
          ),

        for(int i = 0; i<=2 ; i++)
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 37, 211, 102),
              radius: 22.0, 
              child: CircleAvatar(
                backgroundImage: NetworkImage(status[i].imgUrl), 
                radius: 20.0,               
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
          ),

          Container(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text("Viewed updates", 
            style: TextStyle(color: Colors.grey, fontSize: 15)),
          ),

          const Divider(
            height: 10.0, 
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
          )
        ]
      ),
    );
  }
}