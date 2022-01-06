import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/models/grid_item_model.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_one.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_three.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_two.dart';

//TODO remove this
var imageUrl =
    "https://yt3.ggpht.com/CK-gE7gDLuUCh4nqpuofIyya-I5p57lGyof00FE1QtjLZNCLRRPK_Wm5WVXi92GjXi9Sw5wm=w1060-fcrop64=1,00005a57ffffa5a8-k-c0xffffffff-no-nd-rj";

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget get page => _widgetOptions.elementAt(selectedIndex.value);

  static String getPageOneTitle() {
    DateTime dateTime = DateTime.now();

    if (dateTime.hour < 12) {
      return "Bom dia";
    } else if (dateTime.hour > 18) {
      return "Boa Tarde";
    } else {
      return "Boa Noite";
    }
  }

  List<GridItemModel> gridHome = [];
  List<GridItemModel> list1 = [];
  List<GridItemModel> list2 = [];

  Future<void> loadData() async {
    gridHome = List.generate(
      6,
      (index) => GridItemModel(title: "Title $index", image: imageUrl),
    );

    list1 = List.generate(
      6,
      (index) => GridItemModel(
          title: "Title $index",
          // subtitle: "Subitle $index",
          image: imageUrl),
    );

    list2 = List.generate(
      6,
      (index) => GridItemModel(
          title: "Title $index", subtitle: "Subitle $index", image: imageUrl),
    );
  }

  final List<Widget> _widgetOptions = <Widget>[
    PageOne(title: getPageOneTitle()),
    const PageTwo(),
    const PageThree()
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
