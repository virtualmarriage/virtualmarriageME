import 'package:flutter/material.dart';
import 'package:virtualmarriageME/services/Api.dart';
import 'package:virtualmarriageME/utils/PreferenceHelper.dart';
import 'package:virtualmarriageME/utils/codeinput.dart';
import 'package:virtualmarriageME/utils/progressdialog.dart';
import 'package:virtualmarriageME/screens/PreferenceScreen.dart';

import '../HomeScreen.dart';

class OtpVerificationScreen extends StatefulWidget {
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 96.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text("Phone Verification",
                        style: Theme.of(context).textTheme.title),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 48.0),
                    child: Text(
                      "Enter your code here",
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 64.0),
                    child: CodeInput(
                      length: 4,
                      keyboardType: TextInputType.number,
                      builder: CodeInputBuilders.darkCircle(),
                      onFilled: (value) async {
                        print('Your input is $value.');
                        Api().verifyOtp(otp: '$value', context: context).then((value) => {
                          if(value.status && value.data!= null) {
                            PreferenceHelper.saveProfileData(value.data),
                            if(value.data.name == null){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PreferenceScreen(),),)
                            } else {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()),)
                            }
                          }
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Didn't you received any code?",
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()),),
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        "Resend new code",
                        style: TextStyle(
                          fontSize: 19,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}