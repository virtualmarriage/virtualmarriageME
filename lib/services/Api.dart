import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:virtualmarriage/model/ProductData.dart';
import 'package:virtualmarriage/model/UserData.dart';
import 'package:virtualmarriage/utils/PreferenceHelper.dart';
import 'package:virtualmarriage/utils/progressdialog.dart';

class Api {
  final String _baseUrl = "http://yogihost.in/fueldynamic/";

  Future<List<ProductData>> getProductList() async {
    var param = {
      "api": 'productlist'
    };
    String url = _baseUrl;
    print("REQUEST_URL: " + url + "\nREQUEST: " + param.toString());
    try {
      http.Response response = await http.post(url, body: param);
      if (response.statusCode == 200) {
       /* var data = json.decode(response.body);
        PreferenceHelper.saveValueInPreference(keyValue.userData.toString(), json.encode(data['userdata']));*/

        var data = json.decode(response.body);
        List<ProductData> productList = (data["productlist"] as List<dynamic>).map((values) => ProductData.fromJson(values)).toList();
        print("RESPONSE_DATA: " + response.body);
        return productList;
      }
    } on Exception {}
    return null;
  }

  Future<String> login({@required String mobileNo, @required context}) async {
    ProgressDialog progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    var param = {
      "api": 'login',
      "mobile": mobileNo,
    };
    String url = _baseUrl;
    print("REQUEST_URL: " + url);
    try {
      http.Response response = await http.post(url, body: param);
      progressDialog.hide();
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        PreferenceHelper.saveValueInPreference(keyValue.userData.toString(), json.encode(data['userdata']));
        print("RESPONSE: " + response.body);
        //UserData values = await PreferenceHelper.getUserData(keyValue.userData.toString());
        //print("USER ID: " + values.deviceId);
        return response.body;
      }
    } on Exception {
      progressDialog.hide();
    }
    return null;
  }

  /*Future<String> uploadBill({@required File file, @required context}) async {
    ProgressDialog progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Uploading...');
    progressDialog.show();
    UserData userData = await PreferenceHelper.getUserData();
    String url = _baseUrl;
    print("REQUEST_URL: " + url);

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['api'] = 'uploadbill';
      request.fields['user_id'] = userData.ID;
      request.files.add(
          http.MultipartFile(
              'bill',
              file.readAsBytes().asStream(),
              file.lengthSync(),
              filename: file.path.split("/").last
          )
      );
      var response = await request.send();

      progressDialog.hide();
      if (response.statusCode == 200) {
        _alert(context, DialogType.SUCCES, 'Success', 'Bill uploaded successfully.');
        print("RESPONSE: " + response.statusCode.toString());
        return response.statusCode.toString();
        *//*response.stream.transform(utf8.decoder).listen((value) {
          return response.statusCode.toString();
        });*//*
      }
    } on Exception {
      progressDialog.hide();
    }
    return null;
  }*/

  _alert(BuildContext context, DialogType dialogType, String title, String message) {
    AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        headerAnimationLoop: false,
        dialogType: dialogType,
        title: title,
        desc: message,
        btnOkColor: dialogType == DialogType.SUCCES ? Color(0xFF00CA71) : Colors.red,
        btnOkOnPress: () {
          debugPrint('OnClcik');
        },
        btnOkIcon: Icons.check_circle,
        onDissmissCallback: () {
          debugPrint('Dialog Dissmiss from callback');
        })
      ..show();
  }

/*Map<String, String> _headers() {
    return {
      "Accept": "application/json",
      "X-Api-Key": NEWSAPI_KEY,
    };
  }*/
}
