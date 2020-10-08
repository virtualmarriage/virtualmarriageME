import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'HexColor.dart';

class CommonComponent {
  static CircularProgressIndicator circularProgress() {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
    );
  }

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static FlatButton retryButton(Function fetch) {
    return FlatButton(
      child: Text(
        "No Internet Connection.\nPlease Retry",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.normal),
      ),
      onPressed: () => fetch(),
    );
  }

  static showRequestParameter(String url, String param) {
    print("REQUEST_URL: " + url + " \nREQUEST_PARAM: " + param);
  }


}
