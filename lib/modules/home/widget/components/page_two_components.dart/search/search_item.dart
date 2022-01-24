import 'package:flutter/material.dart';
import 'package:spotify_clone/models/search_result.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key, required this.item}) : super(key: key);

  final SearchResult item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.black,
      title: Text(item.name),
      subtitle: Text(item.type.key),
      trailing: const Icon(Icons.more_vert),
      leading: Image.network(
        item.image!,
        height: 40,
        // width: 30,
      ),
    );
  }
}
