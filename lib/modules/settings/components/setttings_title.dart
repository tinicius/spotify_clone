import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';

class SetttingsTitle extends StatelessWidget {
  const SetttingsTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: SizedBox(
        width: double.infinity,
        child: Text(title, style: ThemeConfig().getTextStyle(fontSize: 16)),
      ),
    );
  }
}
