import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/models/grid_item_model.dart';
import 'package:spotify_clone/modules/home/widget/items/page_one_items/list_item_circle.dart';
import 'package:spotify_clone/modules/home/widget/items/page_one_items/list_item_square.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList(
      {Key? key, required this.title, required this.listGridItems})
      : super(key: key);

  final String title;
  final List<GridItemModel> listGridItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                title,
                style: ThemeConfig().getTextStyle(fontSize: 21),
              ),
            ],
          ),
          Flexible(
              fit: FlexFit.loose,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(listGridItems.length, (index) {
                      if (listGridItems[index].subtitle != null) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListItemSquare(
                            item: listGridItems[index],
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListItemCircle(
                            item: listGridItems[index],
                          ),
                        );
                      }
                    }),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
