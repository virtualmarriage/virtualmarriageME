
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:virtualmarriageME/model/ProductData.dart';
import 'package:virtualmarriageME/screens/call/CallPage.dart';
import 'package:virtualmarriageME/screens/profile/ProfileDetailScreen.dart';
import 'package:virtualmarriageME/services/Api.dart';
import 'package:virtualmarriageME/utils/CommonComponent.dart';
import 'package:virtualmarriageME/utils/Constants.dart';
import 'package:virtualmarriageME/utils/HexColor.dart';
import 'package:virtualmarriageME/widgets/ChatListItem.dart';
import 'package:virtualmarriageME/widgets/item_card.dart';
import 'package:permission_handler/permission_handler.dart';

class CallListScreen extends StatefulWidget {
  @override
  _CallListScreenState createState() => _CallListScreenState();
}

class _CallListScreenState extends State<CallListScreen> {
  final PermissionHandler _permissionHandler = PermissionHandler();

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
      backgroundColor: Colors.white,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: ()  {
                  navigateToCallScreen(context);
                },
                child: Text('Call Now'),
              )


              //Categories(),
              /*Expanded(
                child: FutureBuilder<List<ProductData>>(
                  future: _future,
                  builder: (context, snapshot) {
                    //return gridView;
                    return snapshot.connectionState == ConnectionState.done
                        ? snapshot.hasData
                        ? homeGrid(snapshot)
                        : Center(
                      child: CommonComponent.retryButton(fetch),
                    )
                        : Center(child: CommonComponent.circularProgress());
                  },
                ),
              ),*/
            ],
          )
      ),
    );
  }

  setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  Future<Void> navigateToCallScreen(BuildContext context) async {
    await _permissionHandler.requestPermissions([PermissionGroup.camera, PermissionGroup.microphone]);
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context)=> CallPage(channelName: "WpKGYBdPc8euGDQhkzcOpJd8XLI2"),)
    );

  }

  fetch() {
    setLoading(true);
  }

  Container homeGrid(AsyncSnapshot<List<ProductData>> snapshot) {
    return  Container(
      child: ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) => ChatListItem(
            product: snapshot.data[index],
            press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailScreen(),),),
          )),
    );
  }
}


