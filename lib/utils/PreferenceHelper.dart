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
    saveValueInPreference(keyValue.age.toString(), userData.age);
    saveValueInPreference(keyValue.interest.toString(), userData.interest);
    saveValueInPreference(keyValue.gender.toString(), userData.gender);
    saveValueInPreference(keyValue.aboutus.toString(), userData.aboutus);
    saveValueInPreference(keyValue.address.toString(), userData.address);
    if (userData.token != null) {
      saveValueInPreference(keyValue.token.toString(), userData.token);
    }
  }

  static Future<String> getCategoryId(String key) async {
    var value = await getValueFromPreference(key);
    return value;
  }

  static Future<String> getToken() async {
    var value = await getValueFromPreference(keyValue.token.toString());
    return value.toString();
  }

  static Future<String> getUserId() async {
    var value = await getValueFromPreference(keyValue.id.toString());
    return value.toString();
  }

  static Future<UserData> getUserProfile() async {
    var name = await getValueFromPreference(keyValue.name.toString());
    var mobile = await getValueFromPreference(keyValue.mobile.toString());
    var age = await getValueFromPreference(keyValue.age.toString());
    var gender = await getValueFromPreference(keyValue.gender.toString());
    var aboutus = await getValueFromPreference(keyValue.aboutus.toString());
    var address = await getValueFromPreference(keyValue.address.toString());
    UserData user = new UserData();
    user.name = name;
    user.mobile = mobile;
    user.age = age;
    user.gender = gender;
    user.aboutus = aboutus;
    user.address = address;
    //UserData user = value == null? null: UserData.fromJson(json.decode(value.toString()));
    return user;
  }

  static Future<String> getName() async {
    var value = await getValueFromPreference(keyValue.name.toString());
    return value.toString();
  }

  static Future<String> getMobileNo() async {
    var value = await getValueFromPreference(keyValue.mobile.toString());
    return value.toString();
  }

  static setChatStatus(String status) {
    saveValueInPreference(keyValue.chatStatus.toString(),status);
  }
  static Future<String> getChatStatus() async {
    var value = await getValueFromPreference(keyValue.chatStatus.toString());
    return value.toString();
  }
  static setCallStatus(String status) {
    saveValueInPreference(keyValue.callStatus.toString(),status);
  }
  static Future<String> getCallStatus() async {
    var value = await getValueFromPreference(keyValue.callStatus.toString());
    return value.toString();
  }


  static clearPreference() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(keyValue.id.toString());
    prefs.remove(keyValue.token.toString());
    prefs.remove(keyValue.mobile.toString());
    prefs.remove(keyValue.name.toString());
    prefs.remove(keyValue.interest.toString());
    prefs.remove(keyValue.gender.toString());
    prefs.remove(keyValue.aboutus.toString());
    prefs.remove(keyValue.address.toString());
    prefs.remove(keyValue.token.toString());
  }
}

enum keyValue {
  id,
  mobile,
  name,
  age,
  interest,
  gender,
  aboutus,
  address,
  token,
  categoryId,
  showIntro,
  chatStatus,
  callStatus
}
