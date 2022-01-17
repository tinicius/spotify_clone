import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_clone/models/grid_item_model.dart';
import 'package:spotify_clone/models/search_result.dart';
import 'package:spotify_clone/models/section_item_model.dart';
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
    } else if (dateTime.hour > 12 && dateTime.hour < 18) {
      return "Boa Tarde";
    } else {
      return "Boa Noite";
    }
  }

  RxList<GridItemModel> gridHome = <GridItemModel>[].obs;
  RxList<GridItemModel> list1 = <GridItemModel>[].obs;
  RxList<GridItemModel> list2 = <GridItemModel>[].obs;

  RxList<GridItemModel> playlistItems1 = <GridItemModel>[].obs;
  RxList<GridItemModel> playlistItems2 = <GridItemModel>[].obs;
  RxList<GridItemModel> playlistItems3 = <GridItemModel>[].obs;

  RxList<SectionItemModel> allSections = <SectionItemModel>[].obs;

  RxList<SearchResult> searchResult = <SearchResult>[].obs;

  void resetData() {
    gridHome = <GridItemModel>[].obs;
    list1 = <GridItemModel>[].obs;
    list2 = <GridItemModel>[].obs;

    playlistItems1 = <GridItemModel>[].obs;
    playlistItems2 = <GridItemModel>[].obs;
    playlistItems3 = <GridItemModel>[].obs;
  }

  Future<void> loadData() async {
    resetData();

    List<TrackSimple> musics = await spotifyApiRepository.getRecentlyPlayed();

    for (var element in musics) {
      if (gridHome.length < 6) {
        String image =
            await spotifyApiRepository.getImageOfTrackId(element.id!);

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

    for (var i = 0; i < 3; i++) {
      List<Track> tracks =
          await spotifyApiRepository.getTracksOfPlaylist(playlists[i]);

      if (i == 0) {
        for (int i = 0; i < 10; i++) {
          var element = tracks[i];
          var image = await spotifyApiRepository.getImageOfTrackId(element.id!);

          playlistItems1.add(GridItemModel(title: element.name!, image: image));
        }
      } else if (i == 1) {
        for (int i = 0; i < 10; i++) {
          var element = tracks[i];
          var image = await spotifyApiRepository.getImageOfTrackId(element.id!);

          playlistItems2.add(GridItemModel(title: element.name!, image: image));
        }
      } else {
        for (int i = 0; i < 10; i++) {
          var element = tracks[i];
          var image = await spotifyApiRepository.getImageOfTrackId(element.id!);

          playlistItems3.add(GridItemModel(title: element.name!, image: image));
        }
      }
    }
  }

  getCategories() async {
    List<Category> categories = await spotifyApiRepository.getCategories();
    for (var element in categories) {
      allSections.add(SectionItemModel(
          title: element.name!, image: element.icons!.first.url!));
    }
  }

  void resetSearch() {
    searchResult = <SearchResult>[].obs;
  }

  Future<void> search(String text) async {
    try {
      searchResult.value = await spotifyApiRepository.search(
          text, [SearchType.album, SearchType.artist, SearchType.track]);
    } catch (e) {
      searchResult.value = [];
    }
  }

  final List<Widget> _widgetOptions = <Widget>[
    //TODO fix date
    PageOne(title: getPageOneTitle()),
    const PageTwo(),
    const PageThree()
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    print("on close");
  }

  @override
  void onInit() {
    print("on init");
    loadData();
    getCategories();
    super.onInit();
  }

  @override
  void onReady() {
    print("on ready");
    //loadData();
  }

  @override
  void refresh() {
    print("refresh");
    //loadData();
  }
}
