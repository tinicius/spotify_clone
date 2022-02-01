import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:spotify_clone/application/modules/module.dart';
import 'package:spotify_clone/modules/history/history_page.dart';

class HistoryModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: "/history",
      page: () => const HistoryPage(),
      //TODO
      //Add a binding to use an controller
      //binding: 
    )
  ];
}
