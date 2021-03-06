import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/modules/home/home_controller.dart';
import 'package:spotify_clone/modules/home/widget/components/page_one_components/grid_home.dart';
import 'package:spotify_clone/modules/home/widget/components/page_one_components/horizontal_list.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.title),
        actions: [
          const InkWell(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.flash_on_rounded),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed("/history");
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.history_outlined),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed("/inbox");
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.inbox_outlined),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed("/settings");
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.settings_outlined),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            controller.gridHome.isNotEmpty
                ? GridHome(listGridItems: controller.gridHome)
                : Container(),
            controller.list1.isNotEmpty
                ? Flexible(
                    fit: FlexFit.loose,
                    child: HorizontalList(
                      title: "Playlists para voc?? curtir",
                      listGridItems: controller.list1,
                    ))
                : Container(),
            controller.list2.isNotEmpty
                ? Flexible(
                    fit: FlexFit.loose,
                    child: HorizontalList(
                      title: "Albuns para voc?? curtir",
                      listGridItems: controller.list2,
                    ))
                : Container(),
            controller.playlistItems1.isNotEmpty
                ? Flexible(
                    fit: FlexFit.loose,
                    child: HorizontalList(
                      title: "M??sicas para voc?? curtir",
                      listGridItems: controller.playlistItems1,
                    ))
                : Container(),
            controller.playlistItems2.isNotEmpty
                ? Flexible(
                    fit: FlexFit.loose,
                    child: HorizontalList(
                      title: "M??sicas para voc?? curtir",
                      listGridItems: controller.playlistItems2,
                    ))
                : Container(),
            controller.playlistItems3.isNotEmpty
                ? Flexible(
                    fit: FlexFit.loose,
                    child: HorizontalList(
                      title: "M??sicas para voc?? curtir",
                      listGridItems: controller.playlistItems3,
                    ))
                : Container(),
          ],
        ),
      )),
    );
  }
}
