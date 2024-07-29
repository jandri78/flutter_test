import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static bool _isDarkmode = false;
  static int _gender = 1;
  static String _name = '';

  static late SharedPreferences preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static bool get isDarkmode {
    return preferences.getBool('isDarkmode') ?? _isDarkmode;
  }

  static set isDarkmode(bool value) {
    _isDarkmode = value;
    preferences.setBool('isDarkmode', value);
  }

  static int get gender {
    return preferences.getInt('gender') ?? _gender;
  }

  static set gender(int value) {
    _gender = value;
    preferences.setInt('gender', value);
  }

  static String get name {
    return preferences.getString('name') ?? _name;
  }

  static set name(String value) {
    _name = value;
    preferences.setString('name', value);
  }
}
