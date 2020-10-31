class UserResponse {
  bool status;
  String error;
  UserData data;

  UserResponse({this.status, this.error, this.data});

  UserResponse.fromJson(Map map) {
    status = map['status'];
    error = map['error'];
    data =  UserData.fromJson(map['data']);
  }
}

class UserData {
  String id;
  String name;
  String email;
  String mobile;
  String otp;

  UserData({this.id, this.name, this.email, this.mobile, this.otp});

  UserData.fromJson(Map map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    mobile = map['mobile'];
    otp = map['otp'];
  }
}
