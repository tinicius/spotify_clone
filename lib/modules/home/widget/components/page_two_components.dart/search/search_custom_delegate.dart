import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/modules/home/home_controller.dart';
import 'package:spotify_clone/modules/home/widget/components/page_two_components.dart/search/search_item.dart';

class SearchCustomDelegate extends SearchDelegate {
  HomeController controller = Get.find<HomeController>();

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
          Get.toNamed("/search_camera");
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
    return Container(
      color: Colors.black,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      controller.resetSearch();
    }

    return FutureBuilder(
      future: controller.search(query),
      builder: (context, snapshot) {
        if (ConnectionState.waiting == snapshot.connectionState) {
          return Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                  child: CircularProgressIndicator(
                      color: ThemeConfig.green, strokeWidth: 4.0)));
        } else if (controller.searchResult.isEmpty) {
          return Container(
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
          );
        } else {
          return Obx(
            () => ListView.builder(
              itemCount: controller.searchResult.length,
              itemBuilder: (context, index) {
                return SearchItem(item: controller.searchResult[index]);
              },
            ),
          );
        }
      },
    );
  }
}
