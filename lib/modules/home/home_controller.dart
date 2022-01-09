import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_clone/models/grid_item_model.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_one.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_three.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_two.dart';
import 'package:spotify_clone/repositories/spotify_api_repository.dart';

//TODO remove this
var imageUrl = "https://pics.me.me/aaaaaaaaaaaaa-69514034.png";

class HomeController extends GetxController {
  SpotifyApiRepository spotifyApiRepository = Get.find<SpotifyApiRepository>();

  RxInt selectedIndex = 0.obs;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  Widget get page => _widgetOptions.elementAt(selectedIndex.value);

  static String getPageOneTitle() {
    DateTime dateTime = DateTime.now();

    if (dateTime.hour < 12) {
      return "Bom dia";
    } else if (dateTime.hour > 18) {
      return "Boa Tarde";
    } else {
      return "Boa Noite";
    }
  }

  List<GridItemModel> gridHome = [];
  List<GridItemModel> list1 = [];
  List<GridItemModel> list2 = [];

  void resetData() {
    gridHome = [];
    list1 = [];
    list2 = [];
  }

  Future<void> loadData() async {
    resetData();

    List<TrackSimple> musics = await spotifyApiRepository.getRecentlyPlayed();

    for (var element in musics) {
      if (gridHome.length < 6) {
        String image =
            await spotifyApiRepository.getImageOfTrackSimple(element);

        gridHome.add(GridItemModel(title: element.name!, image: image));
      }
    }

    List<PlaylistSimple> playlists =
        await spotifyApiRepository.getRecommendationsPlaylists();

    for (var element in playlists) {
      list1.add(GridItemModel(
          title: element.name!, image: element.images!.first.url!));
    }

    for (var element in musics) {
      if (list2.length < 6) {
        AlbumSimple albumSimple =
            await spotifyApiRepository.getAlbumOfTrackSimple(element);

        list2.add(GridItemModel(
            title: albumSimple.name!, image: albumSimple.images!.first.url!));
      }
    }
  }

  final List<Widget> _widgetOptions = <Widget>[
    PageOne(title: getPageOneTitle()),
    const PageTwo(),
    const PageThree()
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
