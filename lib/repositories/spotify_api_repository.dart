import 'package:spotify/spotify.dart';
import 'package:spotify_clone/services/spotify_api_service.dart';


class SpotifyApiRepository {
  SpotifyApiService _service = SpotifyApiService();

  Future<List<Artist>> getRecommendationsArtists() =>
      _service.getRecommendationsArtists();
}
