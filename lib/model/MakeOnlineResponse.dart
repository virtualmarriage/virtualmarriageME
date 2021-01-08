class MakeOnlineResponse {
  bool status;
  String isOnline;

  MakeOnlineResponse({this.status, this.isOnline});

  MakeOnlineResponse.fromJson(Map map) {
    status = map['status'];
    isOnline = map['isOnline'];
  }
}


