import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/status_model.dart';
import 'package:whatsapp_clone/widgets/image_profile.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {

    var myimage= AssetImage(mystatus[0].imgUrl);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () {
                var router = MaterialPageRoute(
                builder: (context) => ImageProfile(index: mystatus[0].imgUrl)); 
                Navigator.of(context).push(router);
              },
              child: Container(
                padding: const  EdgeInsets.only(top: 25),
                child: CircleAvatar(
                  radius: 80,
                  child: CircleAvatar(
                    backgroundImage: myimage,
                    radius: 80,
                    child: Container(
                      margin: const EdgeInsets.only(left: 105,top: 100),
                      width: 55, 
                      height: 55,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60 / 2),                      
                          color: const  Color.fromARGB(255, 0, 128,106),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 24
                          ),
                        )
                      ),
                    ),
                  )
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListTile(
              leading: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(
                  Icons.person,
                  size: 25, 
                  color: Colors.grey
                ),
              ),
              title: SizedBox(
                height: 50,
                child: Stack(
                  children: const [
                    Positioned(top: 20, child: Text("Name",style: TextStyle(fontSize: 12.0, color: Colors.grey))),
                    Positioned(
                      top: 38,
                      child: Text("Leonardo Valenzuela",
                        style: TextStyle(fontSize: 13.0, color: Colors.black)
                      ),
                    ),
                  ],             
                ),
              ),          
              subtitle: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("This is not your username or pin. This name will be visible to your WhatsApp contacts.",
                    style: TextStyle(fontSize: 11.0,
                    color: Colors.grey
                  )
                ),
              ),
              trailing: const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Icon(
                  Icons.edit,
                  size: 22, 
                  color: Color.fromARGB(255, 0, 128,106)
                ),
              ),
              onTap: () {},
            ),
          ),
          ListTile(
            leading: const Padding(
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.error_outline_rounded,
                size: 25, 
                color: Colors.grey
              ),
            ),
            title: const Text("About",style: TextStyle(fontSize: 12.0, color: Colors.grey)),
            subtitle:const  Text("Hey there! I am using WhatsApp",
              style: TextStyle(fontSize: 13.0, color: Colors.black)
            ),
            trailing: const Icon(
              Icons.edit,
              size: 22, 
              color: Color.fromARGB(255, 0, 128,106)
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Padding(
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.phone,
                size: 25, 
                color: Colors.grey
              ),
            ),
            title: const Text("Phone",style: TextStyle(fontSize: 12.0, color: Colors.grey)),
            subtitle:const  Text("+11 111-1111-111",
              style: TextStyle(fontSize: 13.0, color: Colors.black)
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}