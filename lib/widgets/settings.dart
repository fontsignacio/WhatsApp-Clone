import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/status_model.dart';
import '../models/contact_model.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings",
            style: TextStyle(fontWeight: FontWeight.bold
          )
        )
      ),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(mystatus[0].imgUrl,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      padding: const EdgeInsets.only(bottom: 10),
                        child: const Text("Leonardo Valenzuela",
                          style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500,
                        )
                      )
                    ),
                  ),
                  Positioned(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      padding: const EdgeInsets.only(top: 24),
                      child: const  Text("Hey there! I am using WhatsApp",
                      style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500, color: Colors.black45))
                    ),
                  ),
                ],
              ),
              const Icon(Icons.qr_code, size: 35, color: Colors.grey)
            ],
          ),
          const Divider(),
          Flexible(
            child: ListView(
              children: [
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Transform.rotate(
                      angle: 190,
                      child: const Icon(
                        Icons.key,
                        size: 25, 
                        color: Colors.grey
                      ),
                    ),
                  ),
                  title: const Text("Account",style: TextStyle(fontSize: 17.0)),
                  subtitle: const Text("Privacy, security, change number",
                    style: TextStyle(fontSize: 12.0)
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.chat,
                      size: 25, 
                      color: Colors.grey
                    ),
                  ),
                  title:Text("Chats",style: TextStyle(fontSize: 17.0)),
                  subtitle: Text("Theme, wallpapers, chat history",
                    style: TextStyle(fontSize: 12.0)
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.notifications,
                      size: 25, 
                      color: Colors.grey
                    ),
                  ),
                  title:Text("Notifications",style: TextStyle(fontSize: 17.0)),
                  subtitle: Text("Message, group & call tones",
                    style: TextStyle(fontSize: 12.0)
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.data_saver_off,
                      size: 25, 
                      color: Colors.grey
                    ),
                  ),
                  title:Text("Storage and Data",style: TextStyle(fontSize: 17.0)),
                  subtitle: Text("Network usage, auto-download",
                    style: TextStyle(fontSize: 12.0)
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.help_outline,
                      size: 25, 
                      color: Colors.grey
                    ),
                  ),
                  title:Text("Help",style: TextStyle(fontSize: 17.0)),
                  subtitle: Text("Help center, contact us, privacy policy",
                    style: TextStyle(fontSize: 12.0)
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.group,
                      size: 25, 
                      color: Colors.grey
                    ),
                  ),
                  title:Text("Invite a Friend",style: TextStyle(fontSize: 17.0)),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}