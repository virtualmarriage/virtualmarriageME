import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:virtualmarriageME/model/ProductData.dart';
import 'package:virtualmarriageME/model/UserResponse.dart';
import 'package:virtualmarriageME/utils/CommonComponent.dart';
import 'package:virtualmarriageME/utils/PreferenceHelper.dart';
import 'package:virtualmarriageME/utils/progressdialog.dart';
import 'package:virtualmarriageME/model/EarningData.dart';
import 'package:dio/dio.dart';

class Api {
  final String _baseUrl = "https://virtualmarriage.me/portal/api/v1/serviceProvider/";
  ProgressDialog progressDialog;

  Future<UserResponse> login({@required String mobileNo, @required BuildContext context}) async {
    progressDialog= ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.show();
    try {
      FormData formData = new FormData.fromMap({
        "mobile": "$mobileNo",
        "deviceType": Platform.isAndroid ? 1 : 2,
        "deviceToken": '1234567890',
      });
      print('Request: ${formData.fields}');

      Dio dio = new Dio();
      Response response = await dio.post("${_baseUrl}login/", data: formData);
      print(response);
      progressDialog.hide();
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      progressDialog.hide();
      CommonComponent.showToast('$error');
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }

  Future<UserResponse> verifyOtp({@required String otp, @required BuildContext context}) async {
    String token = await PreferenceHelper.getToken();
    print('token: $token');
    progressDialog= ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Verifying account...');
    progressDialog.show();
    try {
      FormData formData = new FormData.fromMap({
        "otp": "$otp",
      });
      print('Request: ${formData.fields}');

      Dio dio = new Dio();
      //dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers["token"] = token;
      Response response = await dio.post("${_baseUrl}otp/", data: formData);
      print('Response: $response');
      //print('Response 1: ${response.data}');
      progressDialog.hide();
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      progressDialog.hide();
      CommonComponent.showToast('$error');
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }


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

  /*Future<String> login({@required String mobileNo, @required context}) async {
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
  }*/

  Future<List<EarningData>> getEarningList() async {
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
        List<EarningData> productList = (data["productlist"] as List<dynamic>).map((values) => EarningData.fromJson(values)).toList();
        print("RESPONSE_DATA: " + response.body);
        return productList;
      }
    } on Exception {}
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

/*Map<String, String> _headers() {
    return {
      "Accept": "application/json",
      "X-Api-Key": NEWSAPI_KEY,
    };
  }*/
}
