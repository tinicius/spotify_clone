import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:spotify_clone/application/modules/module.dart';
import 'package:spotify_clone/modules/settings/settings_page.dart';

class SettingsModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: "/settings",
      page: () => const SettingsPage(),
      //TODO
      //Add a binding to use an controller
      //binding:
    ),
  ];
}
