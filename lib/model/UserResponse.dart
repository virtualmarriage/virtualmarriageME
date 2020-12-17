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
  String mobile;
  String interest;
  String gender;
  String aboutus;
  String address;


  UserData({this.id, this.token, this.name, this.age, this.mobile, this.interest,
          this.gender, this.aboutus, this.address});

  UserData.fromJson(Map map) {
    id = map['id'];
    token = map['token'];
    name = map['name'];
    age = map['age'];
    mobile = map['mobile'];
    interest = map['interest'];
    gender = map['gender'];
    aboutus = map['aboutus'];
    address = map['address'];

  }
}
