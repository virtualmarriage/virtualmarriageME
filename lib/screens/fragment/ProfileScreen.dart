import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtualmarriage/model/ProductData.dart';
import 'package:virtualmarriage/screens/profile/EditProfileScreen.dart';
import 'package:virtualmarriage/screens/profile/SettingScreen.dart';
import 'package:virtualmarriage/screens/wallet/WalletRecharge.dart';
import 'package:virtualmarriage/screens/wallet/WalletTransaction.dart';
import 'package:virtualmarriage/services/Api.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading;
  Future<List<ProductData>> _future;

  @override
  void initState() {
    super.initState();
    _future = Api().getProductList();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;

    //double ratio = (itemWidth / itemHeight) + .13;
    return Scaffold(
      body: SafeArea(
        child: Container(
          //color: Color(0xffffffe4),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/girl_image.png"),
                      backgroundColor: Colors.grey,
                      radius: 70,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Garima Thakur",
                        style: TextStyle(fontSize: 22, color: Colors.black)),
                    Text("+91 9999546376",
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                  ],
                ),
              ),
              Container(
                child: Divider(
                  color: Color(0xFFEE829C),
                  thickness: 1,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WalletTransaction(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.card_giftcard,
                            color: Color(0xFFEE829C),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Wallet 500 ₹",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileScreen(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Color(0xFFEE829C),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Edit Info",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingScreen(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(Icons.settings, color: Color(0xFFEE829C)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Setting",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Icon(Icons.account_circle),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Account",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Edit Info",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black)),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Edit Info",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WalletRecharge(),
            ),
          );
        },
        label: Text(
          '₹ Recharge Now',
          style: TextStyle(fontSize: 20),
        ),
        //icon: Icon(Icons.monetization_on),
        backgroundColor: Color(0xFFEE829C),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
