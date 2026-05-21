import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static T? get<T>(String key) {
    return _prefs.get(key) as T?;
  }

  static Future<bool> set<T>({required String key, required T value}) {
    if (value is String) {
      return _prefs.setString(key, value);
    } else if (value is int) {
      return _prefs.setInt(key, value);
    } else if (value is double) {
      return _prefs.setDouble(key, value);
    } else if (value is bool) {
      return _prefs.setBool(key, value);
    } else if (value is List<String>) {
      return _prefs.setStringList(key, value);
    } else {
      throw Exception("Unsupported type: ${T.toString()}");
    }
  }

  static Future<bool> remove(String key) {
    return _prefs.remove(key);
  }
}
