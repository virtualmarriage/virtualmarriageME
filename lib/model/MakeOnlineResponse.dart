class MakeOnlineResponse {
  bool status;
  String msg;

  MakeOnlineResponse({this.status, this.msg});

  MakeOnlineResponse.fromJson(Map map) {
    status = map['status'];
    msg = map['msg'];


  }
}


