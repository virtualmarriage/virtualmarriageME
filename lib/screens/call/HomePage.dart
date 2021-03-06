import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'CallPage.dart';

class MyHomePage extends StatefulWidget {
  final String peerId;
  @override
  _MyHomePageState createState() => _MyHomePageState();

  // In the constructor, require a Person
  MyHomePage(
      {
        Key key, @required this.peerId}


      ) : super(key: key);

}

class _MyHomePageState extends State<MyHomePage> {

  final myController = TextEditingController();
  bool _validateError = false;
  final PermissionHandler _permissionHandler = PermissionHandler();
  //SystemChrome.setEnabledSystemUIOverlays([]);

  _MyHomePageState(){
    onJoin();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Video Call'),
        elevation: 0,
      ),
      body: Container(


      )


    /*
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top:100)),
            Image(image: NetworkImage('https://www.agora.io/en/wp-content/uploads/2019/07/agora-symbol-vertical.png'),height: 100,),
            Padding(padding: EdgeInsets.only(top:20)),
            Text('Agora Group Video Call Demo',
             style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),           
             ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Container(
              //padding: EdgeInsets.only(left: 100),
              width: 300,
              child: TextFormField(
                controller: myController,
                decoration: InputDecoration(
                  labelText: 'Channel Name',
                  labelStyle: TextStyle(color: Colors.blue),
                  hintText: 'test',
                  hintStyle: TextStyle(color: Colors.black45),
                  errorText: _validateError ? 'Channel name is mandatory' : null,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                    ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                    ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                    ),
                ),
              

              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            Container(
              width: 90,
              child: MaterialButton(
                onPressed: onJoin,
                height: 40,
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Join', 
                    style: TextStyle(color: Colors.white),),
                    Icon(Icons.arrow_forward,
                    color: Colors.white,
                    ),
                  ],

                ),

              ),
            )
          ],
        ),
      ),*/
    );
  }

  Future<void> onJoin() async{
    print("onJoin=====");
    /*setState(() {
      myController.text.isEmpty 
      ? _validateError = true
      : _validateError = false;
    });*/
    await _permissionHandler.requestPermissions([PermissionGroup.camera, PermissionGroup.microphone]);

    Navigator.push(context, 
    MaterialPageRoute(
      //builder: (context)=> CallPage(channelName: myController.text),)
      builder: (context)=> CallPage(channelName: "a"),)
      );
  }
  

}