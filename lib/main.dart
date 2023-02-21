import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screen/call/provider/callProvider.dart';
import 'package:whatsapp/screen/detail/view/detailPage.dart';
import 'package:whatsapp/screen/home/provider/homeprovider.dart';
import 'package:whatsapp/screen/home/view/homeipage.dart';
import 'package:whatsapp/screen/picview/view/picview.dart';
import 'package:whatsapp/screen/settings/profiepage/view/profilepage.dart';
import 'package:whatsapp/screen/settings/view/settingsPage.dart';
import 'package:whatsapp/screen/status/view/statusshowpage.dart';
import 'package:whatsapp/screen/tabview/provider/tabprovider.dart';
import 'package:whatsapp/screen/tabview/view/tabbaripage.dart';
import 'package:whatsapp/screen/tabview/view/tabbarpage.dart';

void main() {
   SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
       statusBarColor: Colors.teal.shade600,
       systemNavigationBarColor: Colors.teal.shade600,
       systemNavigationBarIconBrightness: Brightness.light,
     ),
   );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => homeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => callprovider(),
        ),
        ChangeNotifierProvider(create: (context) => tabprovider()),
      ],
      child: android(),
    ),
  );
}

Widget android (){
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => tabbarPage(),
      'detail': (context) => DetailPage(),
      'pic': (context) => Picview(),
      'settings': (context) => Settingpage(),
      'profile': (context) => ProfilePage(),
    },
  );
}

Widget iOs (){
  return CupertinoApp(
    theme: CupertinoThemeData(brightness: Brightness.light),
    debugShowCheckedModeBanner: false,
    routes: {

      '/': (context) => TabbariPage(),
      'status': (context) => StatusShowPage(),
      'detail': (context) => DetailPage(),
      'pic': (context) => Picview(),
      'settings': (context) => Settingpage(),
      'profile': (context) => ProfilePage(),
    },
  );
}
