import 'package:flutter/material.dart';
import 'package:spotify_clone/modules/home/widget/items/page_three_items/horizontal_menu_item.dart';

class HorizontalMenu extends StatelessWidget {
  const HorizontalMenu({Key? key, required this.options}) : super(key: key);

  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (context, index) => HorizontalMenuItem(
          option: options[index],
        ),
      ),
    );
  }
}
