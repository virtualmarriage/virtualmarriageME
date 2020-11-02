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
                child: Center(
                  child: Container(

                      width: double.infinity,
                      margin: EdgeInsets.all(20),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

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
                              icon: new Image.asset('assets/leftpanel/ic_down_arrow.png',
                                width: 32, height: 32,),
                              tooltip: 'Closes application',
                              onPressed: () {
                              }
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
                              icon: new Image.asset('assets/leftpanel/ic_down_arrow.png',
                                width: 32, height: 32,),
                              tooltip: 'Closes application',
                              onPressed: () {
                              }
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
                              icon: new Image.asset('assets/leftpanel/ic_down_arrow.png',
                                width: 32, height: 32,),
                              tooltip: 'Closes application',
                              onPressed: () {
                              }
                          ),
                          Text(
                              "Once you initiate the call, our server connects the Call/Chat with your selected person and timing will start.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center),
                          

                        ],
                      )
                  ),
                ),

              ),




            ]
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              //builder: (context) => WalletRecharge(),
            ),
          );
        },
        label: Text(
          '   Watch Tutorial   ',
          style: TextStyle(fontSize: 20),
        ),
        icon: Icon(Icons.video_collection_rounded),
        backgroundColor: Color(0xFFEE829C),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

  }
}
