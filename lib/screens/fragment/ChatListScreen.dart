import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:virtualmarriageME/model/ProductData.dart';
import 'package:virtualmarriageME/screens/chat/chat.dart';
import 'package:virtualmarriageME/screens/profile/ProfileDetailScreen.dart';
import 'package:virtualmarriageME/services/Api.dart';
import 'package:virtualmarriageME/utils/CommonComponent.dart';
import 'package:virtualmarriageME/utils/Constants.dart';
import 'package:virtualmarriageME/utils/HexColor.dart';
import 'package:virtualmarriageME/widgets/ChatListItem.dart';
import 'package:virtualmarriageME/widgets/item_card.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  bool isLoading;
  Future<List<ProductData>> _future;

  @override
  void initState() {
    super.initState();
    _future = Api().getProductList();
  }

  navigateToChatScreen(BuildContext context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(peerId: '12345', peerAvatar: 'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',)));
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
                onTap: (){
                  navigateToChatScreen(context);
                },
                child: Text('Chat Now'),
              )
              //Categories(),
             /* Expanded(
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
              )*/,
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
