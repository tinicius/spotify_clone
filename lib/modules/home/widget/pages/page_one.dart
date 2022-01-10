import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/application/UI/widgets/progress_indicator.dart';
import 'package:spotify_clone/modules/home/home_controller.dart';
import 'package:spotify_clone/modules/home/widget/components/page_one_components/grid_home.dart';
import 'package:spotify_clone/modules/home/widget/components/page_one_components/horizontal_list.dart';

class PageOne extends GetView<HomeController> {
  const PageOne({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(title),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.flash_on_outlined),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.history_outlined),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.inbox_outlined),
            ),
          ),
          InkWell(
            onTap: () {},
            child:const  Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.settings_outlined),
            ),
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: controller.loadData(),
        builder: (context, snapshot) {
          if (ConnectionState.waiting == snapshot.connectionState) {
            return const ProgressIndicatorExtent();
          } else if (ConnectionState.done == snapshot.connectionState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  controller.gridHome.isNotEmpty
                      ? GridHome(listGridItems: controller.gridHome)
                      : Container(),
                  controller.list1.isNotEmpty
                      ? Flexible(
                          fit: FlexFit.loose,
                          child: HorizontalList(
                            title: "Playlists para você curtir",
                            listGridItems: controller.list1,
                          ))
                      : Container(),
                  controller.list2.isNotEmpty
                      ? Flexible(
                          fit: FlexFit.loose,
                          child: HorizontalList(
                            title: "Albuns para você curtir",
                            listGridItems: controller.list2,
                          ))
                      : Container(),
                  controller.playlistItems1.isNotEmpty
                      ? Flexible(
                          fit: FlexFit.loose,
                          child: HorizontalList(
                            title: "Músicas para você curtir",
                            listGridItems: controller.playlistItems1,
                          ))
                      : Container(),
                  controller.playlistItems2.isNotEmpty
                      ? Flexible(
                          fit: FlexFit.loose,
                          child: HorizontalList(
                            title: "Músicas para você curtir",
                            listGridItems: controller.playlistItems2,
                          ))
                      : Container(),
                  controller.playlistItems3.isNotEmpty
                      ? Flexible(
                          fit: FlexFit.loose,
                          child: HorizontalList(
                            title: "Músicas para você curtir",
                            listGridItems: controller.playlistItems3,
                          ))
                      : Container(),
                ],
              ),
            );
          } else {
            return const Text("Error");
          }
        },
      ),
    );
  }
}
