import 'dart:io';

import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screen/status/view/statusshowpage.dart';

import '../../home/provider/homeprovider.dart';

class StatusiPage extends StatefulWidget {
  const StatusiPage({Key? key}) : super(key: key);

  @override
  State<StatusiPage> createState() => _StatusiPageState();
}

class _StatusiPageState extends State<StatusiPage> {
  homeProvider? providereTrue;
  homeProvider? providereFalse;

  @override
  Widget build(BuildContext context) {
    providereTrue = Provider.of<homeProvider>(context, listen: true);
    providereFalse = Provider.of<homeProvider>(context, listen: false);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Privacy",
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Status",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.grey.shade200,
          ),
          // Container(
          //   height: 70,
          //   child: CupertinoListTile(
          //     onTap: () async {
          //       ImagePicker picker = ImagePicker();
          //       XFile? img = await picker.pickImage(source: ImageSource.camera);
          //
          //       providereFalse!.profilepath = img!.path;
          //     },
          //     leading: Stack(
          //       alignment: Alignment.bottomRight,
          //       children: [
          //         (Provider.of<homeProvider>(context).profilepath == null)
          //             ? CircleAvatar(
          //                 radius: 30,
          //                 backgroundImage:
          //                     AssetImage("assets/image/profile.png"),
          //               )
          //             : CircleAvatar(
          //                 radius: 30,
          //                 backgroundImage: FileImage(
          //                   File("${providereTrue!.profilepath}"),
          //                 ),
          //               ),
          //         Container(
          //           height: 20,
          //           width: 20,
          //           decoration: BoxDecoration(
          //               color: Colors.blue, shape: BoxShape.circle),
          //           alignment: Alignment.center,
          //           child: Text(
          //             "+",
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //     title: Text(
          //       "My Status",
          //       style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          //     ),
          //     subtitle: Text(
          //       "Add to my status",
          //       style: TextStyle(
          //           fontWeight: FontWeight.w400,
          //           fontSize: 16,
          //           color: Colors.grey.shade600),
          //     ),
          //   ),
          // ),
          Container(
            height: 70,
            width: double.infinity,
            color: Colors.grey.shade200,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(bottom: 6, left: 12),
            child: Text(
              "RECENT UPDATE",
              style: TextStyle(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w500),
            ),
          ),
          // Container(
          //   height: 70,
          //   child: CupertinoListTile(
          //     onTap: (){
          //       Navigator.push(context, MaterialPageRoute(builder: (context) => StatusShowPage(),),);
          //     },
          //     leading: CircleAvatar(
          //       radius: 30,
          //       backgroundImage: AssetImage("assets/image/ronaldo.png"),
          //     ),
          //     title: Text(
          //       "Ronaldo",
          //       style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          //     ),
          //     subtitle: Text(
          //       "2h ago",
          //       style: TextStyle(
          //           fontWeight: FontWeight.w400,
          //           fontSize: 16,
          //           color: Colors.grey.shade600),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
