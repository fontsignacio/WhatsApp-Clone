import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/contact_model.dart';

class Group extends StatelessWidget {
  const Group({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Stack(
          children: [
            Positioned(
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text("New group ",
                    style: TextStyle(fontWeight: FontWeight.bold
                  )
                )
              )
            ),
            Positioned(
              child: Container(
                padding: const EdgeInsets.only(top: 25),
                child: const Text("Add participants",
                  style: TextStyle(color: Colors.white, fontSize: 13.0)
                )
              )
            ),
          ],
        ),
        actions: const[
            Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.search),
          ),        
        ],
      ),
      body: ListView.builder(
        itemCount: contact.length,
        itemBuilder:(context, i) => Column(
          children: <Widget>[
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(1.5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(contact[i].imgUrl,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text(contact[i].name,
                style: const TextStyle(fontWeight: FontWeight.bold),  
              )]),
              subtitle: Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(contact[0].status,
              style: const TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ), 
              onTap: () {}
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.arrow_forward, color: Colors.white),
        onPressed: (){}
      ),
    );
  }
}