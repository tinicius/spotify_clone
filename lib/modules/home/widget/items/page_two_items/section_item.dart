import 'package:flutter/material.dart';
import 'package:spotify_clone/models/section_item_model.dart';

class SectionItem extends StatelessWidget {
  const SectionItem({Key? key, required this.item}) : super(key: key);

  final SectionItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.network(
              item.image,
              fit: BoxFit.fill,
            ),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 35, 11, 39),
                border: Border.all()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
