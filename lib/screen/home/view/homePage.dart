import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/screen/home/provider/homeprovider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  homeProvider? providereTrue;
  homeProvider? providereFalse;

  @override
  Widget build(BuildContext context) {
    providereTrue = Provider.of<homeProvider>(context, listen: true);
    providereFalse = Provider.of<homeProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 50,
                alignment: Alignment.center,
                child: ListTile(
                  leading: Icon(
                    Icons.archive_outlined,
                    color: Colors.green,
                    size: 26,
                  ),
                  title: Text(
                    "Archived",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: providereTrue!.dataList.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      providereTrue!.h1 = providereTrue!.dataList[index];
                      Navigator.pushNamed(context, 'detail');
                      providereTrue!.removenoti(index);
                    },
                    leading: InkWell(
                      onTap: () {
                        providereTrue!.h1 = providereTrue!.dataList[index];
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            titlePadding: EdgeInsets.all(0),
                            title: Column(
                              children: [
                                Stack(
                                  children: [

                                    SizedBox(
                                      height: 280,
                                      width: 350,
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.pushNamed(context, 'pic');
                                        },
                                        child: Image.asset(
                                          "${providereTrue!.h1!.image}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width: 350,
                                      color: Colors.black38,
                                      height: 45,
                                      child: Text(
                                        "  ${providereTrue!.h1!.name}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 45,
                                  color: Colors.white,
                                  child: Row(
                                    children: [

                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.pushNamed(context, 'detail');
                                          },
                                          icon: Icon(
                                            Icons.message,
                                            color: Color(0xff128c7e),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () async {
                                            await launchUrl(Uri.parse("tel:${providereTrue!.dataList[index].contact}"));

                                          },
                                          icon: Icon(
                                            Icons.call,
                                            color:Color(0xff128c7e),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.videocam,
                                            color: Color(0xff128c7e),
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.info_outline,
                                            color: Color(0xff128c7e),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                        // Navigator.pushNamed(context, 'pic');
                      },
                      child: CircleAvatar(
                        radius: 23,
                        backgroundImage: AssetImage(
                            "${providereTrue!.dataList[index].image}"),
                      ),
                    ),
                    title: Text("${providereTrue!.dataList[index].name}"),
                    subtitle: Text("${providereTrue!.dataList[index].chat}"),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("${providereTrue!.dataList[index].time}"),
                        SizedBox(height: 7),
                        providereTrue!.dataList[index].notification == 0
                            ? Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 20,
                              )
                            : Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${providereTrue!.dataList[index].notification}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle),
                                height: 20,
                                width: 20,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff128c7e),
        onPressed: () {},
        child: Icon(
          Icons.message,
          size: 25,
        ),
      ),
    );
  }
}
