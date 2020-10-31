import 'package:flutter/material.dart';
import 'package:virtualmarriageME/screens/HomeScreen.dart';
import 'package:virtualmarriageME/services/Api.dart';
import 'package:virtualmarriageME/utils/CommonComponent.dart';
import 'package:virtualmarriageME/utils/PreferenceHelper.dart';
import 'package:virtualmarriageME/utils/progressdialog.dart';
import 'package:virtualmarriageME/widgets/SubmitButton.dart';

import 'OtpVerificationScreen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ProgressDialog progressDialog;

  var _txtNumber = TextEditingController();
  String _txtNumberHint = "";

  @override
  void initState() {
    _txtNumber.addListener(() {
      setState(() {
        _txtNumberHint = _txtNumber.text;
        print("Text Number Value: ${_txtNumber.text}");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    return Scaffold (
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
            ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/splash_logo.png', width: 100, height: 100,),
                  SizedBox(height: 5,),
                  Text("WELCOME TO", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.normal),),
                  SizedBox(height: 5,),
                  Text("Virtual Marriage", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.normal),),
                  SizedBox(height: 30,),
                  Padding(padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 20), child: Text("We have sent you an SMS with a code to number +91$_txtNumberHint", textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle)),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 8.0, left: 24.0, right: 24.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(color: Theme.of(context).dividerColor, borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: _txtNumber,
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.number,
                                maxLength: 10,
                                decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    prefixText: '+91 ',
                                    counterText: '',
                                    contentPadding: EdgeInsets.only(left: 10, bottom: 11, top: 11, right: 15),
                                    hintText: "Mobile Number"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SubmitButton(
                     title: "Login",
                      act: () async {
                      if (_txtNumber.text.length == 10) {
                        Api().login(mobileNo: _txtNumber.text, context: context).then((value) => {
                            if(value.data!= null) {
                            PreferenceHelper.saveValueInPreference(keyValue.userData.toString(), value.data.toString()),
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerificationScreen(),),);
                            })
                          }
                        });
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpVerificationScreen(),),);

                        /*progressDialog.show();
                        Future.delayed(const Duration(milliseconds: 1500), () {
                          setState(() {
                            progressDialog.hide();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OtpVerificationScreen(),),);
                          });
                        });*/
                      } else {
                        CommonComponent.showToast("Mobile No should be 10 Digits.");
                      }
                    },
                  ),
                 /* SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),),);
                    },
                    child: Text("SKIP", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal,decoration: TextDecoration.underline,),),
                  )*/
                ],
              ),
            ),
          ),
        )
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Login",
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context)),
      backgroundColor: Colors.white,
    );
  }

}
