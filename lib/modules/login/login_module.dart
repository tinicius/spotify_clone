import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:spotify_clone/application/modules/module.dart';
import 'package:spotify_clone/modules/login/login_bindings.dart';
import 'package:spotify_clone/modules/login/login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routes = [
    GetPage(name: '/login', page: () => LoginPage(), binding: LoginBindings())
  ];
}
