import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/models/section_item_model.dart';

import 'dart:math' as math;

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
            child: Align(
              alignment: Alignment.bottomRight,
              child: Transform.rotate(
                angle: 0,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, -3), // changes position of shadow
                      ),
                    ],
                  ),
                  width: 50,
                  height: 50,
                  child: Image.network(
                    item.image,
                  ),
                ),
              ),
            ),
            // width: double.infinity,
            decoration: BoxDecoration(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1.0),
                border: Border.all()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.title,
              style: ThemeConfig().getTextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
