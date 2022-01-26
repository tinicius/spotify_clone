import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/models/grid_item_model.dart';

class ListItemSquare extends StatelessWidget {
  const ListItemSquare({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            child: Image.network(
              item.image,
              fit: BoxFit.fill,
            ),
            width: 140,
            height: 140,
          ),
        ),
        SizedBox(
          width: 140,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  item.subtitle!,
                  style: TextStyle(color: ThemeConfig.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
