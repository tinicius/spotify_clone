import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:spotify_clone/application/modules/module.dart';
import 'package:spotify_clone/modules/home/home_bindings.dart';
import 'package:spotify_clone/modules/home/home_page.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
        name: '/home', page: () => const HomePage(), binding: HomeBindings())
  ];
}
