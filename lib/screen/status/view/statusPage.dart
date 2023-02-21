import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screen/home/provider/homeprovider.dart';

import '../../tabview/provider/tabprovider.dart';

class Statuspage extends StatefulWidget {
  const Statuspage({Key? key}) : super(key: key);

  @override
  State<Statuspage> createState() => _StatuspageState();
}

class _StatuspageState extends State<Statuspage> {
  homeProvider? providereTrue;
  homeProvider? providereFalse;
  String? path;

  @override
  Widget build(BuildContext context) {
    providereTrue = Provider.of<homeProvider>(context, listen: true);
    providereFalse = Provider.of<homeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: ListTile(
          onTap: () async {
            ImagePicker picker = ImagePicker();
            XFile? img = await picker.pickImage(source: ImageSource.camera);
            setState(() {
              providereFalse!.profilepath = img!.path;
            });
          },
          leading: Stack(
            children: [
              (Provider.of<homeProvider>(context).profilepath == null)
                  ? CircleAvatar(
                radius: 25,
                backgroundImage:
                AssetImage("assets/image/profile.png"),
              )
                  : CircleAvatar(
                radius: 25,
                backgroundImage: FileImage(
                  File(
                      "${providereTrue!.profilepath}"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 30),
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade500, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Text(
                    "+",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          title: Text("My Status"),
          subtitle: Text("Tap to add status update"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.shade400,
          onPressed: () {},
          child: Icon(
            Icons.camera_alt_outlined,
            size: 25,
          ),
        ),
      ),
    );
  }
}
