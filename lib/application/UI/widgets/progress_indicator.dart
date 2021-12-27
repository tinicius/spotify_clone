import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';

class ProgressIndicatorExtent extends StatelessWidget {
  const ProgressIndicatorExtent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ThemeConfig.green,
      ),
    );
  }
}
