import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/screen/call/provider/callProvider.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  callprovider? providereTrue;
  callprovider? providereFalse;

  @override
  Widget build(BuildContext context) {
    providereTrue = Provider.of<callprovider>(context, listen: true);
    providereFalse = Provider.of<callprovider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: providereTrue!.dataList.length,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              radius: 23,
              backgroundImage:
                  AssetImage("${providereTrue!.dataList[index].image}"),
            ),
            title: Text("${providereTrue!.dataList[index].name}"),
            subtitle: Row(
              children: [
                Transform.rotate(
                    angle: 3.14 / 1.3,
                    child: Icon(
                      Icons.arrow_back,
                      size: 17,
                      color: Colors.green,
                    )),
                Text("  ${providereTrue!.dataList[index].time}"),
              ],
            ),
            trailing: IconButton(
                onPressed: () async {
                  await launchUrl(Uri.parse(
                      "tel:${providereTrue!.dataList[index].contact}"));
                },
                icon: Icon(
                  Icons.call,
                  color: Colors.tealAccent.shade700,
                  size: 20,
                )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal.shade400,
          onPressed: () {},
          child: Icon(
            Icons.add_call,
            size: 25,
          ),
        ),
      ),
    );
  }
}
