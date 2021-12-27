import 'package:flutter/material.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';

class SearchCustomDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => '';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: ThemeConfig.grey,

          //app bar color I wanted
        ),
        textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: Colors.red, // Change bubble to red
            cursorColor: ThemeConfig.green,
            selectionColor: Colors.red));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.camera_alt_outlined),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return  Text(
      "results",
      style: ThemeConfig().getTextStyle(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return  Text(
      "suggestions",
      style:ThemeConfig().getTextStyle(),
    );
  }
}
