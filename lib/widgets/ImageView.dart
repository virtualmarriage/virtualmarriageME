import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final File imageFile;
  final Function act;
  ImageView({@required this.imageFile, @required this.act});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(widget.imageFile,),
          ),
        ),
        child: Align(
          alignment: Alignment(.8, -.9),
          child: InkWell(
            onTap: widget.act,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.close,
                size: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}