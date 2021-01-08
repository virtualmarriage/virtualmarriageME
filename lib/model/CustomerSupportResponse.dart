class CustomerSupportResponse {
  bool status;
  String msg;

  CustomerSupportResponse({this.status, this.msg});

  CustomerSupportResponse.fromJson(Map map) {
    status = map['status'];
    msg = map['msg'];
  }
}


