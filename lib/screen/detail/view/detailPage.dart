import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart' as foundation;
import 'package:whatsapp/screen/home/provider/homeprovider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  homeProvider? providereTrue;
  homeProvider? providereFalse;
  bool emojiShowing = false;
TextEditingController txtemoji = TextEditingController();
  @override
  Widget build(BuildContext context) {
    providereTrue = Provider.of<homeProvider>(context, listen: true);
    providereFalse = Provider.of<homeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff128c7e),
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  "${providereTrue!.h1!.image}",
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "  ${providereTrue!.h1!.name}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "  ${providereTrue!.h1!.time}",
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.videocam),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                size: 18,
              ),
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Container(
                    width: 120,
                    child: Text("View contact"),
                    height: 20,
                  ),
                ),
                PopupMenuItem(
                  child: Container(
                    width: 170,
                    child: Text("media, links, and docs"),
                    height: 20,
                  ),
                ),
                PopupMenuItem(
                  child: Container(
                    width: 170,
                    child: Text("Search"),
                    height: 20,
                  ),
                ),
                PopupMenuItem(
                  child: Container(
                    width: 170,
                    child: Text("Mute notification"),
                    height: 20,
                  ),
                ),
                PopupMenuItem(
                  child: Container(
                    width: 170,
                    child: Text("Disappering message"),
                    height: 20,
                  ),
                ),
                PopupMenuItem(
                  child: Container(
                    width: 170,
                    child: Text("Wallpaper"),
                    height: 20,
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    PopupMenuButton(
                      itemBuilder: (context) => [],
                    );
                  },
                  child: Container(
                    width: 170,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("More"),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                        )
                      ],
                    ),
                    height: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,child: Image.asset("assets/image/Background.png",fit: BoxFit.cover,),),

              Stack(
                children: [
                  ListView(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                margin:
                                    EdgeInsets.only(left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.attach_file,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    hintText: "Message   ",
                                    prefixIcon: IconButton(
                                      onPressed: () {

                                      },
                                      icon: Icon(
                                        Icons.emoji_emotions,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8, left: 2),
                              child: CircleAvatar(
                                backgroundColor: Color(0xff128c7e),
                                radius: 22,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.mic,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xffe8e7e7),
      ),
    );
  }

  Widget EmojiSelect() {
    return Offstage(

      offstage: !emojiShowing,      child: SizedBox(
        height: 250,
        child: EmojiPicker(
          textEditingController: txtemoji,
          config: Config(
            columns: 7,
            emojiSizeMax: 32 *
                (foundation.defaultTargetPlatform == TargetPlatform.iOS
                    ? 1.30
                    : 1.0),
            verticalSpacing: 0,
            horizontalSpacing: 0,
            gridPadding: EdgeInsets.zero,
            initCategory: Category.RECENT,
            bgColor: const Color(0xFFF2F2F2),
            indicatorColor: Colors.blue,
            iconColor: Colors.grey,
            iconColorSelected: Colors.blue,
            backspaceColor: Colors.blue,
            skinToneDialogBgColor: Colors.white,
            skinToneIndicatorColor: Colors.grey,
            enableSkinTones: true,
            showRecentsTab: true,
            recentsLimit: 28,
            replaceEmojiOnLimitExceed: false,
            noRecents: const Text(
              'No Recents',
              style: TextStyle(fontSize: 20, color: Colors.black26),
              textAlign: TextAlign.center,
            ),
            loadingIndicator: const SizedBox.shrink(),
            tabIndicatorAnimDuration: kTabScrollDuration,
            categoryIcons: const CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL,
            checkPlatformCompatibility: true,
          ),
        ),
      ),
    );
  }
}
