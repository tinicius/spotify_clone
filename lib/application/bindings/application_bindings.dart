import 'package:get/get.dart';
import 'package:spotify_clone/repositories/spotify_api_repository.dart';
import 'package:spotify_clone/services/spotify_api_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SpotifyApiService(), fenix: true);
    Get.lazyPut(() => SpotifyApiRepository());
  }
}
