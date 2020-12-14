class GetProfileData {
  bool status;
  UserData data;

  GetProfileData({this.status, this.data});

  GetProfileData.fromJson(Map map) {
    status = map['status'];
    //data =  UserData.fromJson(map['data']);
    data =  map['data'] != null ?  UserData.fromJson(map['data']) : null;
  }
}

class UserData {
  String id;
  String name;
  String email;
  String mobile;
  String otp;
  String interest;
  String gender;
  String callStatus;
  String chatStatus;

  UserData({this.id, this.name, this.email, this.mobile, this.otp, this.interest, this.gender, this.callStatus, this.chatStatus});

  UserData.fromJson(Map map) {
    id = map['id'];
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
