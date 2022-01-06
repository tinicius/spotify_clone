
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

    const redirectUri = 'redirect:/';
    final scopes = ['user-read-email', 'user-library-read'];

    final Uri authUri =
        grant.getAuthorizationUrl(Uri.parse(redirectUri), scopes: scopes);

    final result = await FlutterWebAuth.authenticate(
        url: authUri.toString(),
        callbackUrlScheme: "redirect",
        preferEphemeral: true);

    spotify = SpotifyApi.fromAuthCodeGrant(grant, result);
  }

  Future<List<Artist>> getRecommendationsArtists() async {
    return [];
  }
}
