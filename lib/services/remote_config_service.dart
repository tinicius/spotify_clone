import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  RemoteConfig remoteConfig = RemoteConfig.instance;

  Future<Map<String, dynamic>> getClientInfo() async {
    await remoteConfig.fetchAndActivate();

    return {
        "client_id": remoteConfig.getString("client_id"),
        "client_secret": remoteConfig.getString("client_secret")
      };
  }
}
