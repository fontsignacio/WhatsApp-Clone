import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/call_model.dart';

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: calls.length,
        itemBuilder:(context, i) => Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(calls[i].imgUrl),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(calls[i].name,
                    style: const TextStyle(fontWeight: FontWeight.bold)
                  ),  
                ]
              ),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 5.0),  
                child: Text(calls[i].time,
                style: const TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
              trailing: calls[i].icon,

              onTap: () {}
            )
          ]
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add_call, color: Colors.white,),
        onPressed: (){}
      )
      
    );
  }
}