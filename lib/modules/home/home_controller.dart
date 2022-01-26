import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_clone/application/themes/theme_config.dart';
import 'package:spotify_clone/main.dart';
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

  RxList<ItemModel> gridHome = <ItemModel>[].obs;
  RxList<ItemModel> list1 = <ItemModel>[].obs;
  RxList<ItemModel> list2 = <ItemModel>[].obs;
  RxList<ItemModel> playlistItems1 = <ItemModel>[].obs;
  RxList<ItemModel> playlistItems2 = <ItemModel>[].obs;
  RxList<ItemModel> playlistItems3 = <ItemModel>[].obs;

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

      gridHome.add(ItemModel(title: musics[element].name!, image: image));
    }

    for (var element in playlists) {
      list1.add(
          ItemModel(title: element.name!, image: element.images!.first.url!));
    }

    for (var element in musics) {
      if (list2.length < 6) {
        AlbumSimple albumSimple =
            await spotifyApiRepository.getAlbumOfTrackSimple(element);

        list2.add(ItemModel(
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

          playlistItems1.add(ItemModel(title: element.name!, image: image));
        }
      } else if (i == 1) {
        for (int i = 0; i < 10; i++) {
          var element = tracks[i];
          var image = await spotifyApiRepository.getImageOfTrackId(element.id!);

          playlistItems2.add(ItemModel(title: element.name!, image: image));
        }
      } else {
        for (int i = 0; i < 10; i++) {
          var element = tracks[i];
          var image = await spotifyApiRepository.getImageOfTrackId(element.id!);

          playlistItems3.add(ItemModel(title: element.name!, image: image));
        }
      }
    }
  }

  void resetData() {
    gridHome = <ItemModel>[].obs;

    list1 = <ItemModel>[].obs;
    list2 = <ItemModel>[].obs;

    playlistItems1 = <ItemModel>[].obs;
    playlistItems2 = <ItemModel>[].obs;
    playlistItems3 = <ItemModel>[].obs;
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

  void getSnackBar() {
    Get.bottomSheet(
      Container(
        color: ThemeConfig.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            children: [
              Container(
                width: 35,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Classificar por",
                        style: ThemeConfig().getTextStyle(fontSize: 20)),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filterOptions.length,
                itemBuilder: (context, index) {
                  if (selectedFilter.value == index) {
                    return ListTile(
                      onTap: () {
                        selectedFilter.value = index;
                        Get.back();
                      },
                      title: Text(
                        filterOptions[index],
                        style: TextStyle(color: ThemeConfig.green),
                      ),
                      trailing:
                          Icon(Icons.check_outlined, color: ThemeConfig.green),
                    );
                  } else {
                    return ListTile(
                      onTap: () {
                        selectedFilter.value = index;
                        Get.back();
                      },
                      title: Text(
                        filterOptions[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "CANCELAR",
                      style: ThemeConfig().getTextStyle(
                          fontColor: Colors.grey.shade800, fontSize: 15),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  RxInt selectedFilter = 0.obs;

  RxBool isList = false.obs;
  List<ItemModel> libraryItens = List.generate(
    51,
    (index) => ItemModel(title: "Item $index", image: imageUrl),
  );

  final List<String> filterOptions = [
    "Tocadas recentemente",
    "Adicionados recentemente",
    "Ordem alfabética",
    "Criador"
  ];

  String get filterTitle => filterOptions[selectedFilter.value];

  final List<String> menuOptions = [
    "Playslists",
    "Artistas",
    "Álbuns",
    "Podcasts e programas"
  ];

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
