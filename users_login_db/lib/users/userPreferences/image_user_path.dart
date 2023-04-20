import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;
  static const _imagePathKey = 'imagePath';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setImagePath(String imagePath) async =>
      await _preferences!.setString(_imagePathKey, imagePath);

  static String? getImagePath() => _preferences!.getString(_imagePathKey);
}