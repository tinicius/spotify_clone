import 'package:flutter/material.dart';
import 'package:spotify_clone/models/section_item_model.dart';
import 'package:spotify_clone/modules/home/widget/items/page_two_items/section_item.dart';

class GridSection extends StatefulWidget {
  const GridSection({Key? key, required this.items}) : super(key: key);

  final List<SectionItemModel> items;

  @override
  State<GridSection> createState() => _GridSectionState();
}

class _GridSectionState extends State<GridSection> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.items.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return SectionItem(
            item: widget.items[index],
          ); 
        });
  }
}
