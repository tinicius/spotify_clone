import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/modules/home/home_controller.dart';
import 'package:spotify_clone/repositories/spotify_api_repository.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SpotifyApiRepository repository = SpotifyApiRepository();
          await repository.getRecommendationsArtists();
        },
      ),
      body: Obx(() => controller.page),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            backgroundColor: ThemeConfig.black,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.crop_square), label: 'Library')
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: ThemeConfig.selectedItemColor,
            unselectedItemColor: ThemeConfig.unselectedItemColor,
            onTap: (index) {
              controller.onItemTapped(index);
            },
          )),
    );
  }
}
