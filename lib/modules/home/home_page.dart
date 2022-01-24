import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.initHome(),
        builder: (context, snapshot) {
          if (ConnectionState.waiting == snapshot.connectionState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (ConnectionState.done == snapshot.connectionState) {
            return Obx(() => controller.page);
          } else {
            //TODO make erro page
            return const Text("Error");
          }
        },
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: ThemeConfig.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.crop_square_outlined),
              label: 'Library',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: ThemeConfig.selectedItemColor,
          unselectedItemColor: ThemeConfig.unselectedItemColor,
          onTap: (index) {
            controller.onItemTapped(index);
          },
        ),
      ),
    );
  }
}
