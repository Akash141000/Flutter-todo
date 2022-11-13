import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setToken(String? token) async {
    if (_preferences == null || token == null) {
      return;
    }
    await _preferences!.setString('token', token);
    return;
  }

  static Future getToken() async {
    if (_preferences == null) {
      return;
    }
    var token = _preferences!.getString('token');
    return token;
  }

  static Future removeToken() async {
    if (_preferences == null) {
      return;
    }
    _preferences!.remove('token');
  }
}
