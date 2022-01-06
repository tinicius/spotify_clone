import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  RemoteConfig remoteConfig = RemoteConfig.instance;

  Future<Map<String, dynamic>> getClientInfo() async {
    bool updated = await remoteConfig.fetchAndActivate();

    if (updated) {
      return {
        "client_id": remoteConfig.getString("client_id"),
        "client_secret": remoteConfig.getString("client_secret")
      };
    } else {
      return {
        "client_id": remoteConfig.getString("client_id"),
        "client_secret": remoteConfig.getString("client_secret")
      };
    }
  }
}
