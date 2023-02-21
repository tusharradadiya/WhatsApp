import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screen/home/view/homeipage.dart';

import '../../call/view/callipage.dart';
import '../../status/view/statusiPage.dart';

class TabbariPage extends StatefulWidget {
  const TabbariPage({Key? key}) : super(key: key);

  @override
  State<TabbariPage> createState() => _TabbariPageState();
}

class _TabbariPageState extends State<TabbariPage> {
  List pageList=[StatusiPage(),CalliPage(),HomeiPage(),CalliPage(),HomeiPage()];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.change_circle_outlined),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'call',

          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.camera),
            label: 'Camera',
          ),  BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return pageList[index];
          },
        );
      },
    );
  }

}
