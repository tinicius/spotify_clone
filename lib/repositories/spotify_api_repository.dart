import 'package:spotify/spotify.dart';
import 'package:spotify_clone/services/spotify_api_service.dart';

class SpotifyApiRepository {
  final SpotifyApiService _service = SpotifyApiService();

  Future<void> sign() => _service.auth();

  Future<List<Artist>> getRecommendationsArtists() =>
      _service.getRecommendationsArtists();
}
