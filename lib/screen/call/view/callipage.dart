import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/homeprovider.dart';

class CalliPage extends StatefulWidget {
  const CalliPage({Key? key}) : super(key: key);

  @override
  State<CalliPage> createState() => _CalliPageState();
}

class _CalliPageState extends State<CalliPage> {
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
          Icons.add_call,
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
            child: Text("Calls",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
          //           AssetImage("${providereTrue!.dataList[index].image}"),
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
