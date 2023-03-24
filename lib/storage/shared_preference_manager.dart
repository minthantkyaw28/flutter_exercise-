import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  //Sava Data
  Future<void> save({required String key, required dynamic value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value).catchError((error) {
      print(error.message);
    });
  }

  //Read data
  Future<String?> read({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? result = prefs.getString(key);
    return result;
  }

  //Remove Data
  Future<void> remove({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(key);
  }

  //data existance
  Future<bool> existData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.containsKey(key);
  }

  //Drop database
  Future<bool> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.clear();
  }

//Auth

  static Future<void> saveEmail(
      {required String key, required dynamic value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value).catchError((error) {
      print(error.message);
    });
  }

  static Future<void> savePassword(
      {required String key, required dynamic value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(key, value).catchError((error) {
      print(error.message);
    });
  }

  static Future<String?> readEmail({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? result = prefs.getString(key);
    return result;
  }

  static Future<String?> readPassword({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? result = prefs.getString(key);
    return result;
  }
}
