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
  String token;
  String name;
  String email;
  String mobile;
  String otp;
  String interest;
  String gender;
  String callStatus;
  String chatStatus;

  UserData({this.id, this.token, this.name, this.email, this.mobile, this.otp, this.interest, this.gender, this.callStatus, this.chatStatus});

  UserData.fromJson(Map map) {
    id = map['id'];
    token = map['token'];
    name = map['name'];
    email = map['email'];
    mobile = map['mobile'];
    otp = map['otp'];
    interest = map['interest'];
    gender = map['gender'];
    callStatus = map['callStatus'];
    chatStatus = map['chatStatus'];
  }
}
