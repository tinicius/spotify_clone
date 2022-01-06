import 'package:get/get.dart';
import 'package:spotify_clone/services/spotify_api_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<SpotifyApiService>(SpotifyApiService(), permanent: true);
  }
}
