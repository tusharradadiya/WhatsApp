import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/homeprovider.dart';

class HomeiPage extends StatefulWidget {
  const HomeiPage({Key? key}) : super(key: key);

  @override
  State<HomeiPage> createState() => _HomeiPageState();
}

class _HomeiPageState extends State<HomeiPage> {
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
            "Edit",
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        trailing: Icon(
          CupertinoIcons.doc,
          size: 25,
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text("Chats",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
          ),
          Container(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: CupertinoTextField(
                placeholder: "Search",
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              children: [
                Text(
                  "Broadcast Lists",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  "New group",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 1.5,
            width: double.infinity,
            color: Colors.grey.shade300,
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: providereTrue!.dataList.length,
          //     itemBuilder: (context, index) => Container(
          //       height: 70,
          //       child: CupertinoListTile(onTap: (){},
          //         leading: CircleAvatar(
          //           radius: 30,
          //           backgroundImage:
          //               AssetImage("${providereTrue!.dataList[index].image}"),
          //         ),
          //         title: Text("${providereTrue!.dataList[index].name}",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500),),
          //         subtitle: Text("${providereTrue!.dataList[index].chat}",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.grey.shade600),),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
