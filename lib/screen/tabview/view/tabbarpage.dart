import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screen/call/view/callPage.dart';
import 'package:whatsapp/screen/community/view/community.dart';
import 'package:whatsapp/screen/home/view/homePage.dart';
import 'package:whatsapp/screen/status/view/statusPage.dart';
import 'package:whatsapp/screen/tabview/provider/tabprovider.dart';

import '../../home/provider/homeprovider.dart';

class tabbarPage extends StatefulWidget {
  const tabbarPage({Key? key}) : super(key: key);

  @override
  State<tabbarPage> createState() => _tabbarPageState();
}

class _tabbarPageState extends State<tabbarPage> {

  tabprovider? providereTrue;
  tabprovider? providereFalse;
  @override
  Widget build(BuildContext context) {

    providereTrue = Provider.of<tabprovider>(context, listen: true);
    providereFalse = Provider.of<tabprovider>(context, listen: false);
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal.shade600,
            title: Text("WhatsApp"),
            actions: [
              IconButton(
                  onPressed: () async {
                    ImagePicker picker = ImagePicker();
                    XFile? img =
                        await picker.pickImage(source: ImageSource.camera);
                    setState(() {
                      providereFalse!.path = img!.path;
                    });
                  },
                  icon: Icon(Icons.camera_alt_outlined)),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Container(
                      width: 100,
                      child: Text("New group"),
                      height: 20,
                    ),
                  ),
                  PopupMenuItem(
                    child: Container(
                      width: 100,
                      child: Text("New broadcast"),
                      height: 20,
                    ),
                  ),
                  PopupMenuItem(
                    child: Container(
                      width: 100,
                      child: Text("Linked devices"),
                      height: 20,
                    ),
                  ),
                  PopupMenuItem(
                    child: Container(
                      width: 100,
                      child: Text("Starred messages"),
                      height: 20,
                    ),
                  ),
                  PopupMenuItem(
                    child: Container(
                      width: 100,
                      child: Text("payments"),
                      height: 20,
                    ),
                  ),
                  PopupMenuItem(
                    child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'settings');
                      },
                      child: Container(
                        width: double.infinity,
                        child: Text("Settings"),

                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Text(
                    "Chats",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    "Status",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    "Calls",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Homepage(),
              Statuspage(),
              CallPage(),
            ],
          ),
        ),
      ),
    );
  }
}
