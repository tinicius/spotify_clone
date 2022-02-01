import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:spotify_clone/application/modules/module.dart';
import 'package:spotify_clone/modules/search_camera/search_camera_page.dart';

class SearchCameraModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: "/search_camera",
      page: () => const SearchCameraPage(),
      //TODO
      //Add a binding to use an controller
      //binding:
    )
  ];
}
