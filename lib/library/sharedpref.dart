import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _sharedPrefs;

  factory Prefs() => Prefs._internal();

  Prefs._internal();

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  remove(String key) => _sharedPrefs.remove(key);

  String? getString(String key) => _sharedPrefs.getString(key);

  setString(String key, String value) {
    _sharedPrefs.setString(key, value);
  }

  int? getInt(String key) => _sharedPrefs.getInt(key);

  setInt(String key, int value) {
    _sharedPrefs.setInt(key, value);
  }

  double? getDouble(String key) => _sharedPrefs.getDouble(key);

  setDouble(String key, double value) {
    _sharedPrefs.setDouble(key, value);
  }

  bool? getBool(String key) => _sharedPrefs.getBool(key);

  setBool(String key, bool value) {
    _sharedPrefs.setBool(key, value);
  }
}
