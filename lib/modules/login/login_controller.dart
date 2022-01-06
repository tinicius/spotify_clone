import 'package:get/get.dart';
import 'package:spotify_clone/repositories/spotify_api_repository.dart';

class LoginController extends GetxController {
  final SpotifyApiRepository _spotifyApiRepository = SpotifyApiRepository();

  Future<void> sign() async {
    try{
      await _spotifyApiRepository.sign();
    }
    catch(error){
      throw Exception("Erro ao realizar autenticação");
    }
  }
}