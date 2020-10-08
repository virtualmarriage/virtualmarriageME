import 'package:flutter/material.dart';

class MESSAGES {
  static const String INTERNET_ERROR = "No Internet Connection";
  static const String INTERNET_ERROR_RETRY =
      "No Internet Connection.\nPlease Retry";
}

enum keyValue {userData, credit, debit}

const Map<keyValue, String> keyValueName = {
  keyValue.debit: "debit",
  keyValue.credit: "credit",
  keyValue.userData: "userData",
};

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);
const ThemeColor = Color(0xFFEE829C);

const kDefaultPaddin = 20.0;

