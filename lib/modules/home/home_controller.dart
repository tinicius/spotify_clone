import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_clone/models/grid_item_model.dart';
import 'package:spotify_clone/models/search_result.dart';
import 'package:spotify_clone/models/section_item_model.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_one.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_three.dart';
import 'package:spotify_clone/modules/home/widget/pages/page_two.dart';
import 'package:spotify_clone/repositories/spotify_api_repository.dart';

class HomeController extends GetxController {
  //Repositories
  SpotifyApiRepository spotifyApiRepository = Get.find<SpotifyApiRepository>();

  User? user;

  //Bottom navigation attributes
  RxInt selectedIndex = 0.obs;
  List<Widget> _widgetOptions = <Widget>[];

  Widget get page => _widgetOptions.elementAt(selectedIndex.value);

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  //Page one attributes

  //Define a number of itens in menus
  static const int _numberOfItens = 6;

  String title = "";

  RxList<GridItemModel> gridHome = <GridItemModel>[].obs;
  RxList<GridItemModel> list1 = <GridItemModel>[].obs;
  RxList<GridItemModel> list2 = <GridItemModel>[].obs;
  RxList<GridItemModel> playlistItems1 = <GridItemModel>[].obs;
  RxList<GridItemModel> playlistItems2 = <GridItemModel>[].obs;
  RxList<GridItemModel> playlistItems3 = <GridItemModel>[].obs;

  Future<void> loadData() async {
    resetData();

    //Get a list of recent tracks
    List<TrackSimple> musics = await spotifyApiRepository.getRecentlyPlayed();

    //Get a list of suggested playlists
    List<PlaylistSimple> playlists =
        await spotifyApiRepository.getRecommendationsPlaylists();

    for (var element = 0; element < _numberOfItens; element++) {
      String image =
          await spotifyApiRepository.getImageOfTrackId(musics[element].id!);

      gridHome.add(GridItemModel(title: musics[element].name!, image: image));
    }

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

  void resetData() {
    gridHome = <GridItemModel>[].obs;

    list1 = <GridItemModel>[].obs;
    list2 = <GridItemModel>[].obs;

    playlistItems1 = <GridItemModel>[].obs;
    playlistItems2 = <GridItemModel>[].obs;
    playlistItems3 = <GridItemModel>[].obs;
  }

  void setPageOneTitle() {
    DateTime dateTime = DateTime.now();

    if (dateTime.hour < 12) {
      title = "Bom dia";
    } else if (dateTime.hour > 12 && dateTime.hour < 18) {
      title = "Boa Tarde";
    } else {
      title = "Boa Noite";
    }
  }

  //Page two attributes
  RxList<SectionItemModel> allSections = <SectionItemModel>[].obs;
  RxList<SearchResult> searchResult = <SearchResult>[].obs;

  Future<void> getCategories() async {
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

  //Page three attributes
  Future<void> loadUser() async {
    user = await spotifyApiRepository.getUser();
  }

  Future<void> initHome() async {
    await loadUser();
    loadData();
    getCategories();
  }

  //Overrides
  @override
  void onInit() {
    setPageOneTitle();

    _widgetOptions = [
      //TODO fix date
      PageOne(title: title),
      const PageTwo(),
      const PageThree(),
    ];

    super.onInit();
  }
}
