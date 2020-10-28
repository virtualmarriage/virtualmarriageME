import 'package:flutter/material.dart';
import 'package:virtualmarriageME/model/EarningData.dart';
import 'package:virtualmarriageME/model/ProductData.dart';
import 'package:virtualmarriageME/utils/Constants.dart';

class EarningListItem extends StatelessWidget {
  final EarningData earningData;
  final Function press;

  const EarningListItem({
    Key key,
    this.earningData,
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
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                              child: Text(
                                'Order Id',style: TextStyle(
                                fontSize: 16, color: Colors.black
                              ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                  '00080009'
                              )),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                'Ammount',style: TextStyle(
                                  fontSize: 16, color: Colors.black
                              ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                  '200 rs'
                              )),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                'Date',style: TextStyle(
                                  fontSize: 16, color: Colors.black
                              ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                  '16-10-2020'
                              )),
                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                'Credit Amount',style: TextStyle(
                                  fontSize: 16, color: Colors.black
                              ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                  '100'
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                'Debit Amount',style: TextStyle(
                                  fontSize: 16, color: Colors.black
                              ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                  '00'
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                'Description',style: TextStyle(
                                  fontSize: 16, color: Colors.black
                              ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                  'Chat charge for user 10 munits.'
                              )),
                        ],
                      )

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
