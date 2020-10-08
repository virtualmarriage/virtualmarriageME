import 'package:flutter/material.dart';
import 'package:virtualmarriage/utils/chips_choice.dart';

class WalletRecharge extends StatefulWidget {
  @override
  _WalletRechargeState createState() => _WalletRechargeState();
}

class _WalletRechargeState extends State<WalletRecharge> {

  int tag = 1;
  List<String> options = [
    '10', '20', '50',
    '100', '150', '200',
    '250', '300', '350', '400',
    '450','500','1000', '2000', '3000', '4000', '5000',
  ];

  var _orderAmount = TextEditingController();
  String orderAmount;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet Money',
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding : EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
        ),

        child: Column(
          children: [
            Text('Please Select the money for wallet recharge.',
            style: TextStyle(fontSize: 16),),
            SizedBox(height: 10,),
            ChipsChoice<int>.single(
              value: tag,
              options: ChipsChoiceOption.listFrom<int, String>(
                source: options,
                value: (i, v) => i,
                label: (i, v) => v,
              ),
              //onChanged: (val) => setState(() => tag = val),
              onChanged: (val){
                setState(() => {
                  tag = val,
                  _orderAmount.text = options[val]
                  //orderAmount = options[val]
                });
                print("value:: "+options[val]);
              },
              isWrapped: true,
            ),

            SizedBox(height: 20,),
            TextField(
              controller: _orderAmount,
              textInputAction: TextInputAction.continueAction,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
              ),
            ),

            SizedBox(height: 50,),
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
                  child: Text('Proceed',
                    style: TextStyle(fontSize: 22),),
                  onPressed: () {

                    print("pressed---"+_orderAmount.text);
                  },
                )),

          ],
        )
      ),

    );
  }
}
