import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_one.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_three.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_two.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget get page => _widgetOptions.elementAt(selectedIndex.value);

  static const List<Widget> _widgetOptions = <Widget>[
    PageOne(),
    PageTwo(),
    PageThree()
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
