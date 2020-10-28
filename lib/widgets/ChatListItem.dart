import 'package:flutter/material.dart';
import 'package:virtualmarriageME/model/ProductData.dart';
import 'package:virtualmarriageME/utils/Constants.dart';

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
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Material(
                        child: Image.asset("assets/girl_image.png", fit: BoxFit.fill, width: 100.0, height: 100.0,),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        clipBehavior: Clip.hardEdge,
                      ),
                      Flexible(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                //child: Text('Anjali Sharma ${product.post_title}', style: TextStyle(color: Colors.black),),
                                child: Text('Anjali Sharma', style: TextStyle(color: Colors.black,
                                              fontSize: 16),),
                                alignment: Alignment.centerLeft,
                                //margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 5.0),
                              ),
                              Container(
                                child: Text(
                                  'About me: Not available',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                alignment: Alignment.centerLeft,
                                //margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                              ),
                              Container(
                                child: Text(
                                  'Date: 16-10-2020',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                alignment: Alignment.centerLeft,
                                //margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                              ),
                              Container(
                                child: Text(
                                  'Chat Duration: 10:36',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                alignment: Alignment.centerLeft,
                                //margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                              ),
                              Container(
                                child: Text(
                                  'Earning: 30.40 rs',
                                  style: TextStyle(color: Colors.blueGrey),
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
                ),
              ),
              onPressed: null,
              color: Colors.grey,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          )
        ],
      ),
    );
  }
}
