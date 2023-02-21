import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screen/home/provider/homeprovider.dart';

class StatusShowPage extends StatefulWidget {
  const StatusShowPage({Key? key}) : super(key: key);

  @override
  State<StatusShowPage> createState() => _StatusShowPageState();
}

class _StatusShowPageState extends State<StatusShowPage> {
  homeProvider? providereTrue;
  homeProvider? providerefalse;

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 5),
      () => Navigator.pop(context),
    );
    providereTrue = Provider.of(context, listen: true);
    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: 3,
            ),
            LinearProgressIndicator(



            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Image.asset("assets/image/ronaldo.png"),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
