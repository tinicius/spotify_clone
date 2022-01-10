import 'package:spotify/spotify.dart';
import 'package:spotify_clone/repositories/remote_config_repository.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

class SpotifyApiService {
  SpotifyApi? spotify;
  RemoteConfigRepository remoteConfigRepository = RemoteConfigRepository();

  Future<void> auth() async {
    //Get the client credentials from RemoteConfig, in Json format
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
        preferEphemeral: true);

    spotify = SpotifyApi.fromAuthCodeGrant(grant, result);
    SpotifyApiCredentials? a = await spotify?.getCredentials();
    print(a);
  }

  Future<List<Artist>> getRecommendationsArtists() async {
    //TODO
    return [];
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
}
