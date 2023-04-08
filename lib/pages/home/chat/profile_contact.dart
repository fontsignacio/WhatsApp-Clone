import 'package:flutter/material.dart';
import '../../../models/contact_model.dart';
import '../../../widgets/chat/image_profile.dart';
import 'package:whatsapp_clone/pages/home/chat/chat_screen.dart';
import 'dart:math';

enum MenuItem {item1,item2,item3,item4}

class Profile extends StatefulWidget {
  const Profile({super.key, required this.index});
  final int index;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool light = false;

    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 238, 237),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              pinned: true,
              snap: false,
              expandedHeight: 380, 
              excludeHeaderSemantics: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  contact[widget.index].name,
                    style: const TextStyle(fontSize: 18)
                ),
                expandedTitleScale: 2,
                titlePadding: const EdgeInsets.only(left: 50, bottom: 17), 
                background: GestureDetector(
                  onTap: (){
                    var router = MaterialPageRoute(
                    builder: (context) => ImageProfile(index: contact[widget.index].imgUrl));
                    Navigator.pushReplacement(context, router);
                  },
                  child: ClipRRect(
                    child: Image.asset(contact[widget.index].imgUrl,
                      height: 380,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),// Padding of the title from the bottom
              ),
              actions: [
                PopupMenuButton <MenuItem> (
                  onSelected: (value) => {},
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: MenuItem.item1,
                      child: Text("Shere", style: TextStyle(fontSize: 13)),
                    ),
                    PopupMenuItem(
                      value: MenuItem.item2,
                      child: Text("Edit", style: TextStyle(fontSize: 13),),
                    ),
                    PopupMenuItem(
                      value: MenuItem.item3,
                      child: Text("View in address book  ", style: TextStyle(fontSize: 13),),
                    ),
                    PopupMenuItem(
                      value: MenuItem.item4,
                      child: Text("Verify security code  ", style: TextStyle(fontSize: 13),),
                    ),
                  ]  
                )
              ], 
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  switch (index){
                    case 0: return const SizedBox(height: 10);
                    case 1: return SwitchListTile(
                        tileColor: Colors.white,
                        activeColor: const Color.fromARGB(255,  0, 128, 106),
                        title: const Text('Mute notifications'),
                        value: light,
                        onChanged: (bool value) {
                          setState(() {
                            light = value;
                          });
                        },
                        secondary: const Icon(Icons.notifications),
                      );
                    case 2: return  const ListTile(
                        tileColor: Colors.white,
                        leading: Icon(Icons.music_note),
                        title: Text('Custom notifications'),
                      );
                    case 3: return  const ListTile(
                        tileColor: Colors.white,
                        leading: Icon(Icons.image),
                        title: Text('Media visibility'),
                      );
                    case 4: return  const SizedBox(height: 15);
                    case 5: return  const SizedBox(
                      height: 80,
                      child: ListTile(
                          tileColor: Colors.white,
                          leading: Icon(Icons.lock),
                          title: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text('Encryption'),
                          ),
                          subtitle: Text('Messages and calls are end-to-end encrypted. Tap to verify.',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                    );
                    case 6: return  const SizedBox(height: 15);
                    case 7: return  Container(
                        height: 30,
                        alignment: Alignment.topLeft,
                        child: const ListTile(  
                          tileColor: Colors.white,
                          title: Text("About and phone number",
                            style: TextStyle(fontSize: 15, color: Color.fromARGB(255,  0, 128, 106),),
                          ),
                        ),
                      );
                    case 8: return  ListTile(
                        tileColor: Colors.white,
                        title: Text(contact[widget.index].status),
                        subtitle: const Text("2 hours ago",
                          style: TextStyle(fontSize: 13),
                        ),
                      );
                    case 9: return  const Divider(height: 1);
                    case 10: return  ListTile(
                        tileColor: Colors.white,
                        title: const Text("+11 111-1111-111"),
                        subtitle: const Text("Mobile",
                          style: TextStyle(fontSize: 13),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.rotate(
                              angle: pi / 1,
                              child: IconButton(
                                onPressed: () {
                                  var router = MaterialPageRoute(
                                    builder: ((context) => ChatScreen(
                                        name: contact[widget.index].name,
                                        imageUrl: contact[widget.index].imgUrl,
                                        index: widget.index,
                                      )
                                    )
                                  );
                                  Navigator.of(context).push(router);
                                },
                                icon: const Icon(
                                  Icons.message,
                                  color: Color.fromARGB(255,  0, 128, 106),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Icon(Icons.call, color: Color.fromARGB(255,  0, 128, 106),),
                            const SizedBox(width: 20),
                            const Icon(Icons.videocam_rounded, color: Color.fromARGB(255,  0, 128, 106),),
                          ],
                        ),             
                      );         
                    case 11: return  const SizedBox(height: 15);
                    case 12: return  ListTile(
                        tileColor: Colors.white,
                        leading: const Icon(Icons.block, color: Colors.red,),
                        title: Text("Block ${contact[widget.index].name}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    case 13: return  ListTile(
                        tileColor: Colors.white,
                        leading: const Icon(Icons.thumb_down, color: Colors.red,),
                        title: Text("Report ${contact[widget.index].name}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    case 14: return const SizedBox(height: 100);
                    default:
                      return null;
                  }         
                },
                childCount: 16
              )
            )
          ],
        )  
      ),
    );
  }
}