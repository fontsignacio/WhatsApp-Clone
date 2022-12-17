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
                backgroundImage: NetworkImage(status1[0].imgUrl),
                radius: 22.0,               
              )
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text(status1[0].name,
              style: const TextStyle(fontWeight: FontWeight.bold),  
            ),
            ]),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(status1[0].time,
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

          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 37, 211, 102),
              radius: 22.0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(status[0].imgUrl), 
                radius: 20.0,               
              )
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text(status[0].name,
              style: const TextStyle(fontWeight: FontWeight.bold),  
            ),
            ]),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(status[0].time,
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

          ListTile(
            leading: CircleAvatar(
              child: CircleAvatar(
                backgroundImage: NetworkImage(status[1].imgUrl), 
                radius: 22.0,               
              )
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text(status[1].name,
              style: const TextStyle(fontWeight: FontWeight.bold),  
            ),
            ]),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(status[1].time,
              style: const TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
          )
        ]
      ),
    );
  }
}