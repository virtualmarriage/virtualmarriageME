
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:virtualmarriage/model/ProductData.dart';
import 'package:virtualmarriage/screens/profile/ProfileDetailScreen.dart';
import 'package:virtualmarriage/services/Api.dart';
import 'package:virtualmarriage/utils/CommonComponent.dart';
import 'package:virtualmarriage/utils/Constants.dart';
import 'package:virtualmarriage/utils/HexColor.dart';
import 'package:virtualmarriage/widgets/ChatListItem.dart';
import 'package:virtualmarriage/widgets/item_card.dart';

class CallListScreen extends StatefulWidget {
  @override
  _CallListScreenState createState() => _CallListScreenState();
}

class _CallListScreenState extends State<CallListScreen> {
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
              //Categories(),
              Expanded(
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
              ),
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
