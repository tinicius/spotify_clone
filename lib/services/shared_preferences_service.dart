import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? _preferences;

  Future<SharedPreferences> get preferences async {
    if (_preferences != null) {
      return _preferences!;
    } else {
      _preferences = await SharedPreferences.getInstance();
      return _preferences!;
    }
  }

  Future<Map<String, dynamic>> getClientInfo() async {
    return {};
  }

  Future<void> setClientInfo() async {
    
  }

}
