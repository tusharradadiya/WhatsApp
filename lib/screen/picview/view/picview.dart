import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screen/home/provider/homeprovider.dart';

class Picview extends StatefulWidget {
  const Picview({Key? key}) : super(key: key);

  @override
  State<Picview> createState() => _PicviewState();
}

class _PicviewState extends State<Picview> {
  homeProvider? providereTrue;
  homeProvider? providerefalse;

  @override
  Widget build(BuildContext context) {
    providereTrue = Provider.of(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("${providereTrue!.h1!.name}"),
        ),
        body: Center(
          child: PhotoView(
            imageProvider: AssetImage("${providereTrue!.h1!.image}"),
          ),
        ),
      ),
    );
  }
}
