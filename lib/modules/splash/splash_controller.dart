import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  Future<void> onReady() async {
    // TODO remove delayed
    await Future.delayed(const Duration(seconds: 5));
    Get.offAllNamed('/home');
    super.onReady();
  }
}
