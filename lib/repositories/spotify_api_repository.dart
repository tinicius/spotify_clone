import 'package:get/get.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_clone/models/search_result.dart';
import 'package:spotify_clone/services/spotify_api_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SpotifyApiRepository {
  final SpotifyApiService _service = Get.find<SpotifyApiService>();

  User? user;

  Future<void> auth({String? code}) async {
    if (kIsWeb) {
      await _service.authWeb(code!);
    } else {
      await _service.auth();
    }
    user = await _service.getUser();
  }

  Future<String> getAuthLink() => _service.getAuthLink();

  Future<List<TrackSimple>> getRecentlyPlayed() => _service.getRecentlyPlayed();

  Future<List<PlaylistSimple>> getRecommendationsPlaylists() =>
      _service.getRecommendationsPlaylists();

  Future<List<Artist>> getTopArtists() => _service.getTopArtists();

  Future<String> getImageOfTrackId(String trackId) =>
      _service.getImageOfTrackId(trackId);

  Future<AlbumSimple> getAlbumOfTrackSimple(TrackSimple trackSimple) =>
      _service.getAlbumOfTrackSimple(trackSimple);

  Future<List<Track>> getTracksOfPlaylist(PlaylistSimple playlistSimple) =>
      _service.getTracksOfPlaylist(playlistSimple);

  Future<List<Category>> getCategories() => _service.getCategories();

  Future<List<SearchResult>> search(String text, List<SearchType> types) =>
      _service.search(text, types);

  Future<User?> getUser() async {
    if (user != null) {
      return user!;
    } else {
      user = await _service.getUser();

      return user;
    }
  }
}
