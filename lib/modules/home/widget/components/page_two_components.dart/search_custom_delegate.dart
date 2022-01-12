import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';

class SearchCustomDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => '';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: ThemeConfig.grey,
      dividerTheme: const DividerThemeData(
        color: Colors.white,
      ),
      primaryIconTheme: const IconThemeData(color: Colors.white),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ThemeConfig.grey)),
      ),
      brightness: Brightness.dark,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ThemeConfig.green,
      ),
    );
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
    return Expanded(
      child: Container(
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Encontre o que você quer ouvir",
              style: ThemeConfig()
                  .getTextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Busque artistas, músicas, poscasts e muito mais.",
              style: ThemeConfig().getTextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
