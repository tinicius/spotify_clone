import 'package:spotify_clone/services/shared_preferences_service.dart';

class SharedPreferencesRepository {
  final SharedPreferencesService _service = SharedPreferencesService();

  Future<Map<String, dynamic>> getClientInfo() => _service.getClientInfo();
}
