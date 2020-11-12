import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtualmarriageME/model/UserResponse.dart';

class PreferenceHelper {
  static saveValueInPreference(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getValueFromPreference(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key) ?? null;
    //print('sssss '+value.toString());
    return value;
  }

  static saveProfileData(UserData userData) {
    saveValueInPreference(keyValue.id.toString(), userData.id);
    saveValueInPreference(keyValue.mobile.toString(), userData.mobile);
    saveValueInPreference(keyValue.name.toString(), userData.name);
    saveValueInPreference(keyValue.interest.toString(), userData.interest);
    saveValueInPreference(keyValue.gender.toString(), userData.gender);
    saveValueInPreference(keyValue.callStatus.toString(), userData.callStatus);
    saveValueInPreference(keyValue.chatStatus.toString(), userData.chatStatus);
    if(userData.token !=null) {
      saveValueInPreference(keyValue.token.toString(), userData.token);
    }
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

  static Future<String> getToken() async {
    var value = await getValueFromPreference(keyValue.token.toString());
    return value.toString();
  }

  clearPreference() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(keyValue.id.toString());
    prefs.remove(keyValue.token.toString());
    prefs.remove(keyValue.mobile.toString());
    prefs.remove(keyValue.name.toString());
    prefs.remove(keyValue.interest.toString());
    prefs.remove(keyValue.gender.toString());
    prefs.remove(keyValue.callStatus.toString());
    prefs.remove(keyValue.chatStatus.toString());
    prefs.remove(keyValue.token.toString());
  }
}

enum keyValue {
  id,
  mobile,
  name,
  interest,
  gender,
  callStatus,
  chatStatus,
  token,
  categoryId,
  showIntro
}
