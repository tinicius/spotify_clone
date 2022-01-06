import 'package:spotify_clone/services/remote_config_service.dart';

class RemoteConfigRepository {
  final RemoteConfigService _service = RemoteConfigService();

  Future<Map<String, dynamic>> getClientInfo() => _service.getClientInfo();
}
