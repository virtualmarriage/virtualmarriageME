import 'package:flutter/material.dart';

class WalletTransaction extends StatefulWidget {
  @override
  _WalletTransactionState createState() => _WalletTransactionState();
}

class _WalletTransactionState extends State<WalletTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet Transaction',
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
        child: Text('Here we will show transaction history!'),
      ),

    );
  }
}
