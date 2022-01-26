import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/models/grid_item_model.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({Key? key, required this.itens}) : super(key: key);

  final List<ItemModel> itens;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itens.length,
      itemBuilder: (context, index) {
        return itens[index].subtitle == null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(itens[index].image),
                  title: Text(itens[index].title,
                      style: ThemeConfig().getTextStyle()),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    leading: Image.network(itens[index].image),
                    title: Text(itens[index].title,
                        style: ThemeConfig().getTextStyle()),
                    subtitle: Text(itens[index].subtitle ?? "")),
              );
      },
    );
  }
}
