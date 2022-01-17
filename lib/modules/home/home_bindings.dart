import 'package:get/get.dart';
import 'package:spotify_clone/modules/home/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
  }
}
