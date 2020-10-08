import 'package:flutter/material.dart';

class HowToUse extends StatefulWidget {
  @override
  _HowToUse createState() => _HowToUse();
}

class _HowToUse extends State<HowToUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'How to use',
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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
            ),
            child: Center(
              child: new Container(
                  padding: new EdgeInsets.all(40.0),
                  child: Column(
                    children: <Widget>[
                      //Image.asset('assets/splash_logo.png', width: 200, height: 200,),
                      Text(
                          "Recharge your wallet using credit card, debit card, net banking, UPI, paytm, paypal or other wallets.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 10,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Select a person for Call/Chat from the list of 1000+ profiles available.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                      ),
                      Text("Click on Call/Chat button.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: 10,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                          "Once you initiate the call, our server connects the Call/Chat with your selected person and timing will start.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
