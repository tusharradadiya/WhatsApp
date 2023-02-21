import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screen/home/provider/homeprovider.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({Key? key}) : super(key: key);

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff128c7e),
          title: Text(
            "Settings ",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, 'profile');
              },
              leading: (Provider.of<homeProvider>(context).profilepath == null)
                  ? CircleAvatar(
                radius: 30,
                backgroundImage:
                AssetImage("assets/image/profile.png"),
              )
                  : CircleAvatar(
                radius: 30,
                backgroundImage: FileImage(
                  File(
                      "${Provider.of<homeProvider>(context, listen: true).profilepath}"),
                ),
              ),
              title: Text(
                "Tushar radadiya ",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),

              contentPadding: EdgeInsets.only(right:8,left: 5,top: 5),
              subtitle: Text("Family 🥰❤",style: TextStyle(fontSize: 17,),),
              trailing: Icon(Icons.qr_code),
            ),
            Container(width: double.infinity,height: 0.7,margin: EdgeInsets.only(top: 5,bottom: 5),color: Colors
              .grey,),
            ListTile(
              leading: Transform.rotate(
                angle: 3.14 / 2,
                child: Icon(Icons.key_outlined),
              ),
              title: Text(
                "Account",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Security notifications,change\nnumber"),
            ),
            ListTile(
              leading: Icon(Icons.emoji_emotions_outlined),
              title: Text(
                "Avatar",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Create,edit,profile photo"),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text(
                "Privacy",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Block contacts,disappearing\nmessages"),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text(
                "Chats",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Theme,Wallpapers,chart history"),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text(
                "Notifications",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Message,group & call tones"),
            ),
            ListTile(
              leading: Icon(Icons.data_saver_off),
              title: Text(
                "Storage and data",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Network usage, auto-download"),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text(
                "App languge",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("English (phone's languge)"),
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text(
                "Help",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text("Help center,contect us,privacy policy"),
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text(
                "Invite a friend",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text("from",style: TextStyle(color: Colors.black54),),
                  Text("Meta",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
