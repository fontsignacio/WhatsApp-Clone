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
  return ListView.builder(
      itemCount: status.length,
      itemBuilder:(context, i) => Column(
        children: <Widget>[
          const Divider(
            height: 10.0,
          ),
          ListTile(
            leading: CircleAvatar(
              child: CircleAvatar(
                backgroundImage: NetworkImage(status1[0].imgUrl), 
                radius: 20.0,               
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

          const Text("Recent updates", 
          style: TextStyle(color: Colors.grey, fontSize: 15.0),),
          
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
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
          )
        ]
      ),
    );
  }
}