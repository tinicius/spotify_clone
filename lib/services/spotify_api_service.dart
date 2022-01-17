import 'package:spotify/spotify.dart';
import 'package:spotify_clone/models/search_result.dart';
import 'package:spotify_clone/repositories/remote_config_repository.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SpotifyApiService {
  SpotifyApi? spotify;
  RemoteConfigRepository remoteConfigRepository = RemoteConfigRepository();

  Future<void> auth() async {
    final Map<String, dynamic> credentialsJson =
        await remoteConfigRepository.getClientInfo();

    final SpotifyApiCredentials credentials = SpotifyApiCredentials(
        credentialsJson["client_id"], credentialsJson["client_secret"]);

    final grant = SpotifyApi.authorizationCodeGrant(credentials);

    const redirectUri = 'yourname:/';

    final scopes = [
      'user-read-email',
      'user-library-read',
      'user-library-modify',
      'user-library-read',
      'app-remote-control',
      'user-top-read',
      'user-read-recently-played',
    ];

    final Uri authUri =
        grant.getAuthorizationUrl(Uri.parse(redirectUri), scopes: scopes);

    final result = await FlutterWebAuth.authenticate(
      url: authUri.toString(),
      callbackUrlScheme: "yourname",
      preferEphemeral: true,
    );

    spotify = SpotifyApi.fromAuthCodeGrant(grant, result);
  }

  Future<List<TrackSimple>> getRecentlyPlayed() async {
    List<TrackSimple> recentTracks = [];

    try {
      Iterable<PlayHistory>? recentTracksHistory =
          await spotify?.me.recentlyPlayed();

      recentTracksHistory?.forEach((element) {
        recentTracks.add(element.track!);
      });

      return recentTracks;
    } catch (error) {
      return recentTracks;
    }
  }

  Future<String> getImageOfTrackId(String trackId) async {
    Track? track = await spotify?.tracks.get(trackId);
    return track!.album!.images!.first.url!;
  }

  Future<AlbumSimple> getAlbumOfTrackSimple(TrackSimple trackSimple) async {
    Track? track = await spotify?.tracks.get(trackSimple.id!);
    return track!.album!;
  }

  Future<List<Artist>> getTopArtists() async {
    List<Artist> artists = [];

    try {
      Iterable<ArtistSimple>? iterableArtists = await spotify?.me.topArtists();

      for (ArtistSimple element in iterableArtists!) {
        Artist? artist = await spotify?.artists.get(element.id!);
        artists.add(artist!);
      }

      return artists;
    } catch (e) {
      return artists;
    }
  }

  Future<List<Track>> getTracksOfPlaylist(PlaylistSimple playlistSimple) async {
    List<Track> tracks = [];

    try {
      Page<Track>? page = await spotify?.playlists
          .getTracksByPlaylistId(playlistSimple.id)
          .first();

      Iterable<Track>? iterableTracks = page?.items;

      iterableTracks?.forEach((element) {
        tracks.add(element);
      });

      return tracks;
    } catch (e) {
      return tracks;
    }
  }

  Future<List<PlaylistSimple>> getRecommendationsPlaylists() async {
    List<PlaylistSimple> playlists = [];

    Iterable<PlaylistSimple>? iterablePlaylists =
        await spotify?.playlists.featured.all();

    iterablePlaylists?.forEach((element) {
      playlists.add(element);
    });

    return playlists;
  }

  Future<List<Category>> getCategories() async {
    List<Category> categories = [];

    var client = http.Client();

    SpotifyApiCredentials? credentials = await spotify?.getCredentials();

    try {
      var response = await http.get(
        Uri.parse(
          "https://api.spotify.com/v1/browse/categories",
        ),
        headers: {"Authorization": "Bearer ${credentials?.accessToken}}"},
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        for (var item in jsonResponse['categories']['items']) {
          categories.add(Category.fromJson(item));
        }
      }
    } finally {
      client.close();
    }

    return categories;
  }

  Future<List<SearchResult>> search(String text, List<SearchType> types) async {
    List<SearchResult> searchResult = [];

    if (text.isNotEmpty) {
      for (var element in types) {
        BundledPages? pages = spotify?.search.get(text);
        List<Page<dynamic>> listPages = await pages!.first();
        Page<dynamic> firstPage = listPages.first;

        for (var item in firstPage.items!) {
          PlaylistSimple simple = item;

          searchResult.add(SearchResult(
              name: simple.name!,
              type: element,
              image: simple.images?.first.url));
        }
      }
    }
    return searchResult;
  }
}
