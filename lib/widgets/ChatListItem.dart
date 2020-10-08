import 'package:flutter/material.dart';
import 'package:virtualmarriage/model/ProductData.dart';
import 'package:virtualmarriage/utils/Constants.dart';

class ChatListItem extends StatelessWidget {
  final ProductData product;
  final Function press;

  const ChatListItem({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: FlatButton(
              child: Row(
                children: <Widget>[
                  Material(
                    child: Image.asset("assets/girl_image.png", fit: BoxFit.fill, width: 50.0, height: 50.0,),
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    clipBehavior: Clip.hardEdge,
                  ),
                  Flexible(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text('Anjali Sharma', style: TextStyle(color: Colors.black),),
                            alignment: Alignment.centerLeft,
                            //margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                          ),
                          Container(
                            child: Text(
                              'About me: Not available',
                              style: TextStyle(color: Colors.grey),
                            ),
                            alignment: Alignment.centerLeft,
                            //margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          )
                        ],
                      ),
                      margin: EdgeInsets.only(left: 20.0),
                    ),
                  ),
                ],
              ),
              onPressed: null,
              color: Colors.grey,
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 25.0, 10.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          )
        ],
      ),
    );
  }
}
