import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/homemodel.dart';


class homeProvider extends ChangeNotifier {
  String? profilepath;

  List<homeModel> dataList = [
   homeModel(image: "assets/image/flutter.png", name: "8.00 FLUTTER BATCH", chat: "જય ભારત સાથે જનવાનુ કે",notification: 1,time: "9.15 am",contact: "79845454"),
   homeModel(image: "assets/image/virat.png", name: "virat", chat: "hello",notification: 0,time: "Yesterday",contact: "455455454"),
   homeModel(image: "assets/image/ronaldo.png", name: "ronaldo", chat: "hey,",notification: 2,time: "2.56 pm",contact: "4456875"),
   homeModel(image: "assets/image/lion.png", name: "ronak flutter", chat: "Kyare avv cho?,",notification: 1,time: "2.48 pm",contact: "79845454"),
   homeModel(image: "assets/image/flutter.png", name: "8.00 FLUTTER BATCH", chat: "જય ભારત સાથે જનવાનુ કે",notification: 1,time: "9.15 am",contact: "79845454"),
   homeModel(image: "assets/image/virat.png", name: "virat", chat: "hello",notification: 0,time: "Yesterday",contact: "79845454"),
   homeModel(image: "assets/image/ronaldo.png", name: "ronaldo", chat: "hey,",notification: 2,time: "2.56 pm",contact: "79845454"),
   homeModel(image: "assets/image/lion.png", name: "ronak flutter", chat: "Kyare avv cho?,",notification: 0 ,time: "2.48 pm",contact: "79845454"),
   homeModel(image: "assets/image/flutter.png", name: "8.00 FLUTTER BATCH", chat: "જય ભારત સાથે જનવાનુ કે",notification: 1,time: "9.15 am",contact: "79845454"),
   homeModel(image: "assets/image/virat.png", name: "virat", chat: "hello",notification: 0,time: "Yesterday",contact: "79845454"),
   homeModel(image: "assets/image/ronaldo.png", name: "ronaldo", chat: "hey,",notification: 2,time: "2.56 pm",contact: "79845454"),
   homeModel(image: "assets/image/lion.png", name: "ronak flutter", chat: "Kyare avv cho?,",notification: 1,time: "2.48 pm",contact: "79845454"),
   homeModel(image: "assets/image/flutter.png", name: "8.00 FLUTTER BATCH", chat: "જય ભારત સાથે જનવાનુ કે",notification: 1,time: "9.15 am",contact: "79845454"),
   homeModel(image: "assets/image/virat.png", name: "virat", chat: "hello",notification: 0,time: "Yesterday",contact: "79845454"),
   homeModel(image: "assets/image/ronaldo.png", name: "ronaldo", chat: "hey,",notification: 2,time: "2.56 pm",contact: "79845454"),
   homeModel(image: "assets/image/lion.png", name: "ronak flutter", chat: "Kyare avv cho?,",notification: 1,time: "2.48 pm",contact: "79845454"),
  ];

  homeModel? h1 ;
  void removenoti(index){
    dataList[index].notification = 0;
    notifyListeners();
  }

  void setimage(path){
    profilepath = path;
    notifyListeners();
  }
  void removepic(){
    profilepath = null;
    notifyListeners();
  }



}
