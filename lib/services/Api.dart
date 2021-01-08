import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:virtualmarriageME/model/BannerData.dart';
import 'package:virtualmarriageME/model/CustomerSupportResponse.dart';
import 'package:virtualmarriageME/model/GetProfileData.dart';
import 'package:virtualmarriageME/model/MakeOnlineResponse.dart';
import 'package:virtualmarriageME/model/ProductData.dart';
import 'package:virtualmarriageME/model/UserResponse.dart';
import 'package:virtualmarriageME/utils/CommonComponent.dart';
import 'package:virtualmarriageME/utils/PreferenceHelper.dart';
import 'package:virtualmarriageME/utils/progressdialog.dart';
import 'package:virtualmarriageME/model/EarningData.dart';
import 'package:dio/dio.dart';

import 'LoggingInterceptor.dart';

class Api {
  final String _baseUrl = "https://virtualmarriage.me/portal/api/v1/serviceProvider/";
  final String _baseUrl_comman = "https://virtualmarriage.me/portal/api/v1/common/";
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
      progressDialog.hide();
      Map jsonMap = jsonDecode(response.data);
      return UserResponse.fromJson(jsonMap);
    } catch (error, stacktrace) {
      progressDialog.hide();
      CommonComponent.showToast('$error');
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }

  Future<UserResponse> updateProfile({@required String name, @required String age,
    @required String gender, @required String aboutus, @required String address, @required String interest,
    @required BuildContext context}) async {
    String token = await PreferenceHelper.getToken();
    print('token: $token');
    progressDialog= ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Updating Profile...');
    progressDialog.show();
    try {
      FormData formData = new FormData.fromMap({
        "name": "$name",
        "age": "$age",
        "gender": "$gender",
        "aboutus": "$aboutus",
        "address": "$address",
        "interest": "$interest",
      });
      print('Request: ${formData.fields}');

      Dio dio = new Dio();
      dio.options.headers["token"] = token;
      Response response = await dio.post("${_baseUrl}updateprofile/", data: formData);
      print('Response: $response');
      progressDialog.hide();
      Map jsonMap = jsonDecode(response.data);
      return UserResponse.fromJson(jsonMap);
    } catch (error, stacktrace) {
      progressDialog.hide();
      CommonComponent.showToast('$error');
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }

  Future<UserResponse> getProfile({@required BuildContext context}) async {
    String token = await PreferenceHelper.getToken();
    print('token: $token');
    progressDialog= ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Getting Profile...');
    progressDialog.show();
    try {

      Dio dio = new Dio();
      dio.options.headers["token"] = token;
      //Response response = await dio.post("${_baseUrl}getProfile/");
      print("REQUEST_URL: " + _baseUrl );
      Response response = await dio.get("${_baseUrl}getProfile");
      print('Response: $response');
      progressDialog.hide();
      Map jsonMap = jsonDecode(response.data);
      return UserResponse.fromJson(jsonMap);
    } catch (error, stacktrace) {
      progressDialog.hide();
      CommonComponent.showToast('$error');
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }

  Future<String> uploadPhoto({@required BuildContext context, @required File file}) async {
    String token = await PreferenceHelper.getToken();
    print('token: $token');
    progressDialog= ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Uploading...');
    progressDialog.show();

    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image":
      await MultipartFile.fromFile(file.path, filename:fileName),
    });
    print('Request: ${formData.fields}');

    Dio dio = new Dio();
    dio.options.headers["token"] = token;
    Response response = await dio.post("${_baseUrl}uploadphoto/", data: formData);
    print('Response: $response');
    progressDialog.hide();
    return response.data['id'];
  }


  Future<MakeOnlineResponse> makeOnline({@required BuildContext context,
                                    @required String type,
                                      @required String isOnline,}) async {
    String token = await PreferenceHelper.getToken();
    print('token: $token');
    progressDialog= ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Updating...');
    progressDialog.show();
    try {
      FormData formData = new FormData.fromMap({
        "type": "$type",
        "isOnline": "$isOnline",
      });
      print('Request: ${formData.fields}');

      Dio dio = new Dio();
      dio.options.headers["token"] = token;
      Response response = await dio.post("${_baseUrl}makeOnline/", data: formData);
      print('Response: $response');
      progressDialog.hide();
      Map jsonMap = jsonDecode(response.data);
      return MakeOnlineResponse.fromJson(jsonMap);
    } catch (error, stacktrace) {
      progressDialog.hide();
      CommonComponent.showToast('$error');
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }

  Future<CustomerSupportResponse> customerSupport({@required BuildContext context,
    @required String name,
  @required String email,
  @required String phone,
  @required String probDes,
  @required String type,}) async {
    String token = await PreferenceHelper.getToken();
    print('token: $token');
    String userId = await PreferenceHelper.getUserId();
    print('userId: $userId');
    String status = "1";
    progressDialog= ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Sending Data...');
    progressDialog.show();
    try {
      FormData formData = new FormData.fromMap({
        "name": "$name",
        "email": "$email",
        "phone": "$phone",
        "problemDescription": "$probDes",
        "type": "$type",
        "userid": "$userId",
        "status": "$status",
      });
      print('Request: ${formData.fields}');

      Dio dio = new Dio();
      //dio.interceptors.add(LoggingInterceptor());
      dio.options.headers["token"] = token;
      Response response = await dio.post("${_baseUrl_comman}customerSupport", data: formData);
      print('Response: $response');
      progressDialog.hide();
      Map jsonMap = jsonDecode(response.data);
      return CustomerSupportResponse.fromJson(jsonMap);
    } catch (error, stacktrace) {
      progressDialog.hide();
      CommonComponent.showToast('$error');
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }

  Future<CustomerSupportResponse> vmConsultation({@required BuildContext context,
    @required String name,
    @required String email,
    @required String phone,
    @required String message,
    @required String category,
    @required String type,}) async {
    String token = await PreferenceHelper.getToken();
    print('token: $token');
    String userId = await PreferenceHelper.getUserId();
    print('userId: $userId');
    String status = "1";
    progressDialog= ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Sending Data...');
    progressDialog.show();
    try {
      FormData formData = new FormData.fromMap({
        "name": "$name",
        "email": "$email",
        "phone": "$phone",
        "message": "$message",
        "type": "$type",
        "userid": "$userId",
        "status": "$status",
        "category": "$category",
      });
      print('Request: ${formData.fields}');

      Dio dio = new Dio();
      //dio.interceptors.add(LoggingInterceptor());
      dio.options.headers["token"] = token;
      Response response = await dio.post("${_baseUrl_comman}vmConsultation", data: formData);
      print('Response: $response');
      progressDialog.hide();
      Map jsonMap = jsonDecode(response.data);
      return CustomerSupportResponse.fromJson(jsonMap);
    } catch (error, stacktrace) {
      progressDialog.hide();
      CommonComponent.showToast('$error');
      print("Exception occured: $error stackTrace: $stacktrace");
      return error;
    }
  }



  Future<List<BannerData>> getBanner({@required BuildContext context}) async {
    String token = await PreferenceHelper.getToken();
    print('token: $token');
    progressDialog= ProgressDialog(context, ProgressDialogType.Normal);
    progressDialog.setMessage('Getting Profile...');
    progressDialog.show();
    try {

      Dio dio = new Dio();
      dio.options.headers["token"] = token;
      //Response response = await dio.post("${_baseUrl}getProfile/");
      print("REQUEST_URL: " + _baseUrl );
      Response response = await dio.get("${_baseUrl}getBanner");
      print('Response: $response');
      progressDialog.hide();
      //Map jsonMap = jsonDecode(response.data);
      var data = json.decode(response.data);
      List<BannerData> bannerList = (data["data"] as List<dynamic>).map((values) => BannerData.fromJson(values)).toList();
      print("RESPONSE_DATA: " + response.data);
      return bannerList;
      //return GetBannerResponse.fromJson(jsonMap);
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
