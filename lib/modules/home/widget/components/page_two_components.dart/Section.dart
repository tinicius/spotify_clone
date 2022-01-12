import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/models/section_item_model.dart';
import 'package:spotify_clone/modules/home/widget/components/page_two_components.dart/grid_section.dart';

class Section extends StatelessWidget {
  const Section({Key? key, required this.title, required this.items})
      : super(key: key);

  final String title;
  final RxList<SectionItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                title,
                style: ThemeConfig().getTextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        GridSection(
          items: items,
        )
      ],
    );
  }
}
