import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String title;
  final Function act;
  RoundedButton({@required this.title, @required this.act});

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 50,
        child: RaisedButton(
          onPressed: widget.act,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.blue)),
          elevation: 10,
          color: Colors.blue,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person_add,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  "ग्राहक जोड़े",
                  style: TextStyle(color: Colors.white,fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}