import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:spotify_clone/application/modules/module.dart';
import 'package:spotify_clone/modules/inbox/inbox_page.dart';

class InboxModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(
      name: "/inbox",
      page: () => const InboxPage(),
      //TODO
      //Add a binding to use an controller
      //binding:
    )
  ];
}
