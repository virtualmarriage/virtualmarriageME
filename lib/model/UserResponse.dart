class UserResponse {
  bool status;
  String error;
  UserData data;

  UserResponse({this.status, this.error, this.data});

  UserResponse.fromJson(Map map) {
    status = map['status'];
    error = map['error'];
    //data =  UserData.fromJson(map['data']);
    data =  map['data'] != null ?  UserData.fromJson(map['data']) : null;
  }
}

class UserData {
  String id;
  String token;
  String name;
  String age;
  String email;
  String mobile;
  String otp;
  String interest;
  String gender;
  String aboutus;
  String address;
  String callStatus;
  String chatStatus;

  UserData({this.id, this.token, this.name, this.age, this.email, this.mobile, this.otp, this.interest,
          this.gender, this.aboutus, this.address, this.callStatus, this.chatStatus});

  UserData.fromJson(Map map) {
    id = map['id'];
    token = map['token'];
    name = map['name'];
    age = map['age'];
    email = map['email'];
    mobile = map['mobile'];
    otp = map['otp'];
    interest = map['interest'];
    gender = map['gender'];
    aboutus = map['aboutus'];
    address = map['address'];
    callStatus = map['callStatus'];
    chatStatus = map['chatStatus'];
  }
}
