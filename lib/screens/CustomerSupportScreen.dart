import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtualmarriageME/screens/HomeScreen.dart';
import 'package:virtualmarriageME/services/Api.dart';

class CustomerSupportScreen extends StatefulWidget {
  @override
  _CustomerSupportScreenState createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final problemDescriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tech Support'),
          backgroundColor: Color(0xFFEE829C),
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
              ),
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Customer Support will contact you soon! \nPlease submit bellow details',
                            style: TextStyle(
                                color: Color(0xFFEE829C),
                                fontWeight: FontWeight.w500,
                                fontSize: 18, ),
                          )),

                      SizedBox(height: 20,),

                      TextFormField(
                        controller: nameController,
                        decoration: new InputDecoration(
                          labelText: "Your Name",
                          labelStyle: TextStyle( color: Color(0xFFEE829C) ),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              color: Color(0xFFEE829C),
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (val) {
                          if(val.length==0) {
                            return "Name cannot be empty";
                          }else{
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          //color: Color(0xFFEE829C),
                          fontSize: 18,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: emailController,
                        decoration: new InputDecoration(
                          labelText: "E-Mail",
                          labelStyle: TextStyle( color: Color(0xFFEE829C) ),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              color: Color(0xFFEE829C),
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (val) {
                          if(val.length==0) {
                            return "Age cannot be empty";
                          }else{
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          //color: Color(0xFFEE829C),
                          fontSize: 18,
                          fontFamily: "Poppins",
                        ),
                      ),

                      SizedBox(height: 20,),
                      TextFormField(
                        controller: phoneController,
                        decoration: new InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: TextStyle( color: Color(0xFFEE829C) ),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              color: Color(0xFFEE829C),
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (val) {
                          if(val.length==0) {
                            return "Phone cannot be empty";
                          }else{
                            return null;
                          }
                        },
                        keyboardType: TextInputType.phone,
                        style: new TextStyle(
                          //color: Color(0xFFEE829C),
                          fontSize: 18,
                          fontFamily: "Poppins",
                        ),
                      ),

                      SizedBox(height: 20,),
                      TextFormField(
                        controller: problemDescriptionController,
                        minLines: 4,
                        maxLines: 6,
                        decoration: new InputDecoration(
                          labelText: "Problem Description",
                          labelStyle: TextStyle( color: Color(0xFFEE829C) ),
                          fillColor: Colors.white,
                          filled: true,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              color: Color(0xFFEE829C),
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (val) {
                          if(val.length==0) {
                            return "Problem description cannot be empty";
                          }else{
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          //color: Color(0xFFEE829C),
                          fontSize: 18,
                          fontFamily: "Poppins",
                        ),
                      ),


                      SizedBox(height: 40,),
                      Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Color(0xFFEE829C))
                            ),
                            textColor: Colors.white,
                            color: Color(0xFFEE829C),
                            child: Text('Submit Details',
                              style: TextStyle(fontSize: 20),),
                            onPressed: () {

                              Api().customerSupport(context: context, name: '${nameController.text}',
                                  email: '${emailController.text}',
                                  phone: '${phoneController.text}',
                                  probDes: '${problemDescriptionController.text}',
                                  type: 'me').then((value) => {
                                if(value.status != null) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()),)
                                }
                              });

                            },
                          )),
                    ],
                  ))),
        ),
    );
  }
}

