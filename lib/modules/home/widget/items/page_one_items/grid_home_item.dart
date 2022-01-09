import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/models/grid_item_model.dart';

class GridHomeItem extends StatelessWidget {
  const GridHomeItem({Key? key, required this.gridItemModel}) : super(key: key);

  final GridItemModel gridItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
              child: Image.network(
                gridItemModel.image,
                fit: BoxFit.fill,
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              width: 50,
              height: 50),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: ThemeConfig.grey,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6))),
              child: Center(
                child: Text(
                  gridItemModel.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: ThemeConfig().getTextStyle(fontSize: 12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
