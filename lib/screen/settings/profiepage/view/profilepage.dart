import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screen/home/provider/homeprovider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff128c7e),
          title: Text(
            "Profile ",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'pic');
                    Provider.of<homeProvider>(context).h1!.image =   Provider.of<homeProvider>(context).profilepath;
                  },
                  child: Stack(alignment: Alignment.bottomRight,
                    children: [

                      (Provider.of<homeProvider>(context).profilepath == null)
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage:
                                  AssetImage("assets/image/profile.png"),
                            )
                          : CircleAvatar(
                              radius: 64,
                              backgroundImage: FileImage(
                                File(
                                    "${Provider.of<homeProvider>(context, listen: true).profilepath}"),
                              ),
                            ),
                      InkWell(
                        onTap: () {
                          selectImage();
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              color: Color(0xff128c7e), shape: BoxShape.circle),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              title: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 15),
                      ),
                      Text(
                        "Tushar Radadiya",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.edit,
                    color: Color(0xff128c7e),
                  ),
                ],
              ),
              subtitle: Text(
                  "\nThis is not your username or pin.This name will be visible to ypur WhatsApp contects."),
              leading: Icon(Icons.person),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 15),
                      ),
                      Text(
                        "Family❤",
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.edit,
                    color: Color(0xff128c7e),
                  ),
                ],
              ),
              leading: Icon(Icons.info_outline),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "phone",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                  ),
                  Text(
                    "1122334455",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ],
              ),
              leading: Icon(Icons.call),
            ),
          ],
        ),
      ),
    );
  }

  void selectImage() {
    String? path;
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Profile photo",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Provider.of<homeProvider>(context,listen: false).removepic();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.grey.shade600,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        FloatingActionButton(
                          onPressed: () async {
                            ImagePicker picker = ImagePicker();
                            XFile? img = await picker.pickImage(
                                source: ImageSource.camera);
                            Provider.of<homeProvider>(context, listen: false)
                                .setimage(img!.path);
                          },
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: Color(0xff128c7e),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Camera",
                          style: TextStyle(
                              fontSize: 18, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        FloatingActionButton(
                          onPressed: () async {
                            ImagePicker picker = ImagePicker();
                            XFile? img = await picker.pickImage(
                                source: ImageSource.gallery);
                            Provider.of<homeProvider>(context, listen: false)
                                .setimage(img!.path);
                          },
                          child: Icon(
                            Icons.photo,
                            color: Color(0xff128c7e),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Gallary",
                          style: TextStyle(
                              fontSize: 18, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
