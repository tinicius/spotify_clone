import 'package:flutter/material.dart';
import 'package:spotify_clone/models/grid_item_model.dart';
import 'package:spotify_clone/modules/home/widget/items/page_one_items/grid_home_item.dart';

class GridHome extends StatelessWidget {
  const GridHome({Key? key, required this.listGridItems}) : super(key: key);

  final List<ItemModel> listGridItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listGridItems.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 80 / 20),
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GridHomeItem(
                gridItemModel: listGridItems[index],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GridHomeItem(
                gridItemModel: listGridItems[index],
              ),
            );
          }
        });
  }
}
