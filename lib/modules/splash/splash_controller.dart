import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  Future<void> onReady() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.offAllNamed('/login');
    super.onReady();
  }
}
