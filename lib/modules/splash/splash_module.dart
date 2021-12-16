import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:spotify_clone/application/modules/module.dart';
import 'package:spotify_clone/modules/splash/splash_bindings.dart';
import 'package:spotify_clone/modules/splash/splash_page.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routes = [GetPage(name: '/', page: () => const SplashPage(), binding: SplashBindings())];
}
