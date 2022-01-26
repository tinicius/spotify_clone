import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/models/grid_item_model.dart';

class LibraryGrid extends StatelessWidget {
  const LibraryGrid({Key? key, required this.itens}) : super(key: key);

  final List<ItemModel> itens;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...itens.sublist(0, itens.length ~/ 2).map((item) => Column(
                  children: [
                    Container(
                      color: Colors.green,
                      child: Image.network(item.image, fit: BoxFit.fill),
                      height: 150,
                      width: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: 150,
                        child: Text(item.title,
                            style: ThemeConfig().getTextStyle()),
                      ),
                    ),
                    Text(item.subtitle ?? ""),
                  ],
                )),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...itens.sublist(itens.length ~/ 2).map(
                  (item) => Column(
                    children: [
                      Container(
                        color: Colors.green,
                        child: Image.network(item.image, fit: BoxFit.fill),
                        height: 150,
                        width: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: 150,
                          child: Text(item.title,
                              style: ThemeConfig().getTextStyle()),
                        ),
                      ),
                      Text(item.subtitle ?? ""),
                    ],
                  ),
                )
          ],
        )
      ],
    );
  }
}
