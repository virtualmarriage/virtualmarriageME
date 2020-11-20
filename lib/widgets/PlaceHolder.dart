import 'package:flutter/material.dart';

class PlaceHolder extends StatefulWidget {
  final Function act;
  PlaceHolder({@required this.act});

  @override
  _PlaceHolderState createState() => _PlaceHolderState();
}

class _PlaceHolderState extends State<PlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.act,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/place_holder.png"),
          ),
        ),
        child: Container()/*Align(
          alignment: Alignment(.8, -.9),
          child: InkWell(
            onTap: () {
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ),
        )*/,
      ),
    );
  }
}