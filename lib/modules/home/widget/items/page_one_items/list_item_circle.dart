import 'package:flutter/material.dart';
import 'package:spotify_clone/models/grid_item_model.dart';

class ListItemCircle extends StatelessWidget {
  const ListItemCircle({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipOval(
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
