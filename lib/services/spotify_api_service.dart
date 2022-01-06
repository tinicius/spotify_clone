import 'package:http/http.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_clone/repositories/remote_config_repository.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_web_auth/flutter_web_auth.dart';

class SpotifyApiService {
  SpotifyApi? spotify;
  RemoteConfigRepository remoteConfigRepository = RemoteConfigRepository();

  Future<void> auth() async {
    final Map<String, dynamic> credentialsJson =
        await remoteConfigRepository.getClientInfo();

    final SpotifyApiCredentials credentials = SpotifyApiCredentials(
        credentialsJson["client_id"], credentialsJson["client_secret"]);

    //spotify = SpotifyApi(credentials);

    final grant = SpotifyApi.authorizationCodeGrant(credentials);

    const redirectUri = 'https://www.spotify.com/br/';
    final scopes = ['user-read-email', 'user-library-read'];

    final Uri authUri = grant.getAuthorizationUrl(
      Uri.parse(redirectUri),
      scopes: scopes, // scopes are optional
    );

    print(authUri.toString());

    var responseUri;

    final result = await FlutterWebAuth.authenticate(
        url: authUri.toString(),
        callbackUrlScheme: "my-custom-app");

// Extract token from resulting url
    final token = Uri.parse(result).queryParameters['code'];

    spotify = SpotifyApi.fromAuthCodeGrant(grant, responseUri);
  }

  Future<List<Artist>> getRecommendationsArtists() async {
    await auth();
    //  spotify.
    //   var response = await spotify?.recommendations.get();

    return [];
  }
}
