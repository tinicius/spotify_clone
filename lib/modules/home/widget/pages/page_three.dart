import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/models/grid_item_model.dart';
import 'package:spotify_clone/modules/home/home_controller.dart';
import 'package:spotify_clone/modules/home/widget/components/page_three_components/avatar_profile.dart';
import 'package:spotify_clone/modules/home/widget/components/page_three_components/horizontal_menu.dart';
import 'package:spotify_clone/modules/home/widget/components/page_three_components/library_grid.dart';
import 'package:spotify_clone/modules/home/widget/components/page_three_components/library_list.dart';
import 'package:spotify_clone/modules/home/widget/components/page_three_components/list_settings.dart';

import '../../../../main.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

List<ItemModel> libraryItens = List.generate(
  63,
  (index) => ItemModel(title: "Item $index", image: imageUrl),
);

class _PageThreeState extends State<PageThree> {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search_outlined),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add_outlined),
            ),
          ),
        ],
        leading: AvatarProfile(
          user: controller.user!,
        ),
        title: const Text('Sua biblioteca'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Obx(() => Column(
              children: [
                HorizontalMenu(options: controller.menuOptions),
                ListSettings(
                    filter: controller.filterTitle,
                    onPressed: controller.getSnackBar),
                controller.isList.value
                    ? LibraryGrid(itens: libraryItens)
                    : LibraryList(itens: libraryItens)
              ],
            )),
      ),
    );
  }
}
