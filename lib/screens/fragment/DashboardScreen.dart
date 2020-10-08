
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:virtualmarriage/model/ProductData.dart';
import 'package:virtualmarriage/screens/profile/ProfileDetailScreen.dart';
import 'package:virtualmarriage/services/Api.dart';
import 'package:virtualmarriage/utils/CommonComponent.dart';
import 'package:virtualmarriage/utils/Constants.dart';
import 'package:virtualmarriage/utils/HexColor.dart';
import 'package:virtualmarriage/widgets/item_card.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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

  Padding homeGrid(AsyncSnapshot<List<ProductData>> snapshot) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: GridView.builder(
          itemCount: snapshot.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: kDefaultPaddin,
            crossAxisSpacing: kDefaultPaddin,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) => ItemCard(
            product: snapshot.data[index],
            press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileDetailScreen(),),),
          )),
    );
    /*return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0, top: 5.0),
      child: GridView.builder(
        itemCount: snapshot.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          mainAxisSpacing: kDefaultPaddin,
          crossAxisSpacing: kDefaultPaddin,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
              elevation: 5.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.network(
                    snapshot.data[index].imagename,
                    //width: 200,
                    height: 160,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 2,),
                  Text(snapshot.data[index].post_title.toString(), maxLines:1,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,)),
                  SizedBox(
                    height: 5,
                  ),
                  Text('₹${snapshot.data[index].price}'),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    //width: 100.0,
                    height: 28.0,
                    margin:
                    const EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0),
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.green,
                      textColor: Colors.black,
                      child: Text('Add To Cart',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(), settings: RouteSettings(arguments: snapshot.data[index])),);
            },
          );
        },
      ),
    );*/
  }

}
