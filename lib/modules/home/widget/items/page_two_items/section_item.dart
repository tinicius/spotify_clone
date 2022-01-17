import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/models/section_item_model.dart';

import 'dart:math' as math;

class SectionItem extends StatelessWidget {
  const SectionItem({Key? key, required this.item}) : super(key: key);

  final SectionItemModel item;

  ShapeBorder? get a => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Positioned(
                  right: -10,
                  child: Transform.rotate(
                    angle: (math.pi / 180) * 20,
                    child: Container(
                      width: 60,
                      height: 60,
                      color: Colors.white,
                      child: ClipPath(
                        child: Image.network(item.image),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   child: Container(
          //     child: Image.network(
          //       item.image,
          //     ),
          //     decoration: BoxDecoration(
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black.withOpacity(0.5),
          //           spreadRadius: 1,
          //           blurRadius: 11,
          //           offset: const Offset(0, -2), // changes position of shadow
          //         ),
          //       ],
          //     ),

          //   ),
          //   // width: double.infinity,
          //   decoration: BoxDecoration(
          //       color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          //           .withOpacity(1.0),
          //       border: Border.all()),
          // ),

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
