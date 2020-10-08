class UserData {
  String ID;
  String user_login;
  String user_nicename;
  String user_email;
  String display_name;

  UserData({
    this.ID,
    this.user_login,
    this.user_nicename,
    this.user_email,
    this.display_name
  });

  UserData.fromJson(Map map) {
    ID = map['ID'];
    user_login = map['user_login'];
    user_nicename = map['user_nicename'];
    user_email = map['user_email'];
    display_name = map['display_name'];
  }
}
