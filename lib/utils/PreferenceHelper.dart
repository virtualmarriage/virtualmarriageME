import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static saveValueInPreference(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getValueFromPreference(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key) ?? null;
    return value;
  }

  /*static Future<UserData> getUserData() async {
    var value = await getValueFromPreference(keyValue.userData.toString());
    UserData user = value == null? null: UserData.fromJson(json.decode(value.toString()));
    return user;
  }*/

  static Future<String> getCategoryId(String key) async {
    var value = await getValueFromPreference(key);
    return value;
  }

  clearPreference() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(keyValue.userData.toString());
  }
}

enum keyValue { userData,categoryId,showIntro }
