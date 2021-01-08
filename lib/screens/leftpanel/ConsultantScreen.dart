
import 'package:flutter/material.dart';
import 'package:virtualmarriageME/screens/HomeScreen.dart';
import 'package:virtualmarriageME/services/Api.dart';

class ConsultantScreen extends StatefulWidget {
  @override
  _ConsultantScreenState createState() => _ConsultantScreenState();
}

class _ConsultantScreenState extends State<ConsultantScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VM Consultation',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
        ),
        child: Column(
            children: [

              Card(
                child: Container(

                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

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

                        SizedBox(
                          height: 20,
                        ),

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



                        SizedBox(
                          height: 20,
                        ),

                        Text("Categories List"),


                        SizedBox(
                          height: 20,
                        ),

                        TextFormField(
                          controller: messageController,
                          minLines: 4,
                          maxLines: 6,
                          decoration: new InputDecoration(
                            labelText: "Type Message Here",
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

                                 Api().vmConsultation(context: context, name: '${nameController.text}',
                          email: '${emailController.text}',
                          phone: '${phoneController.text}',
                          message: '${messageController.text}',
                                     category: 'Discussion',
                          type: 'me').then((value) => {
                        if(value.status != null) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()),)
                        }
                      });

                              },
                            )),


                      ],
                    )
                ),

              ),




            ]
        ),
      ),

    );
  }


}
