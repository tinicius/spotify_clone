import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';

class HorizontalMenuItem extends StatelessWidget {
  const HorizontalMenuItem({Key? key, required this.option}) : super(key: key);

  final String option;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: ThemeConfig.grey, width: 2),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Text(option, style: ThemeConfig().getTextStyle()),
          ))),
    );
  }
}
