import 'dart:io';

import 'package:flutter/material.dart';
import 'package:virtualmarriageME/services/Api.dart';
import 'package:virtualmarriageME/utils/chips_choice.dart';
import 'package:virtualmarriageME/widgets/ImageSelector.dart';
import 'package:virtualmarriageME/widgets/ImageView.dart';
import 'package:virtualmarriageME/widgets/PlaceHolder.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreen createState() => _EditProfileScreen();
}

class _EditProfileScreen extends State<EditProfileScreen> {
  String radioItem = '';
  List<RadioModel> ganderData = new List<RadioModel>();
  String dropdownValue = 'One';

  int tag = 1;
  List<String> tags = [];
  List<String> options = [
    'Bidi',
    'Daru',
    'Hukkka',
    'Hot Chat',
    'Ghoomana',
    'Trip',
    'Outing',
    'Travel',
    'Food',
    'Coffee',
    'Meeting',
  ];

  File imageFile1;
  File imageFile2;
  File imageFile3;
  File imageFile4;
  File imageFile5;
  File imageFile6;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ganderData.add(new RadioModel(false, 'Women', 'assets/icon_female.png'));
    ganderData.add(new RadioModel(false, 'Man', 'assets/icon_male.png'));
    ganderData.add(new RadioModel(false, 'Other', 'assets/icon_female.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Profile',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: imageFile1 == null
                          ? PlaceHolder(
                              act: () => {
                                ImageSelector()
                                    .showPicker(context)
                                    .then((value) => {
                                          setState(() {
                                            imageFile1 = value;
                                          }),
                                          uploadPhoto(context, imageFile1)
                                        }),
                              },
                            )
                          : ImageView(
                              imageFile: imageFile1,
                              act: () => {
                                    setState(() {
                                      imageFile1 = null;
                                    })
                                  }),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: imageFile2 == null
                          ? PlaceHolder(
                              act: () => {
                                ImageSelector()
                                    .showPicker(context)
                                    .then((value) => {
                                          setState(() {
                                            imageFile2 = value;
                                          }),
                                          uploadPhoto(context, imageFile2)
                                        }),
                              },
                            )
                          : ImageView(
                              imageFile: imageFile2,
                              act: () => {
                                    setState(() {
                                      imageFile2 = null;
                                    })
                                  }),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: imageFile3 == null
                          ? PlaceHolder(
                              act: () => {
                                ImageSelector()
                                    .showPicker(context)
                                    .then((value) => {
                                          setState(() {
                                            imageFile3 = value;
                                          }),
                                          uploadPhoto(context, imageFile3)
                                        }),
                              },
                            )
                          : ImageView(
                              imageFile: imageFile3,
                              act: () => {
                                    setState(() {
                                      imageFile3 = null;
                                    })
                                  }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: imageFile4 == null
                          ? PlaceHolder(
                              act: () => {
                                ImageSelector()
                                    .showPicker(context)
                                    .then((value) => {
                                          setState(() {
                                            imageFile4 = value;
                                          }),
                                          uploadPhoto(context, imageFile4)
                                        }),
                              },
                            )
                          : ImageView(
                              imageFile: imageFile4,
                              act: () => {
                                    setState(() {
                                      imageFile4 = null;
                                    })
                                  }),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: imageFile5 == null
                          ? PlaceHolder(
                              act: () => {
                                ImageSelector()
                                    .showPicker(context)
                                    .then((value) => {
                                          setState(() {
                                            imageFile5 = value;
                                          }),
                                          uploadPhoto(context, imageFile5)
                                        }),
                              },
                            )
                          : ImageView(
                              imageFile: imageFile5,
                              act: () => {
                                    setState(() {
                                      imageFile5 = null;
                                    })
                                  }),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: imageFile6 == null
                          ? PlaceHolder(
                              act: () => {
                                ImageSelector()
                                    .showPicker(context)
                                    .then((value) => {
                                          setState(() {
                                            imageFile6 = value;
                                          }),
                                          uploadPhoto(context, imageFile6)
                                        }),
                              },
                            )
                          : ImageView(
                              imageFile: imageFile6,
                              act: () => {
                                    setState(() {
                                      imageFile6 = null;
                                    }),
                                  }),
                    ),
                  ],
                ),
                Container(
                  color: Color(0xffffffff),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Your name",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              color: Color(0xFFEE829C),
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Name cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 18,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Your age",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: new BorderSide(
                              color: Color(0xFFEE829C),
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Age cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        maxLength: 2,
                        keyboardType: TextInputType.number,
                        style: new TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 18,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Center(
                      child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ganderData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new InkWell(
                            //highlightColor: Colors.red,
                            splashColor: Color(0xFFEE829C),
                            onTap: () {
                              setState(() {
                                ganderData.forEach(
                                    (element) => element.isSelected = false);
                                ganderData[index].isSelected = true;
                                if (index == 0) {
                                  radioItem = "Women";
                                } else if (index == 1) {
                                  radioItem = "Man";
                                } else if (index == 2) {
                                  radioItem = "Other";
                                }
                              });
                            },
                            child: RadioItem(ganderData[index]),
                          );
                        },
                      ),
                    )),
                Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Interests", style: TextStyle(fontSize: 16)),
                        ChipsChoice<String>.multiple(
                          value: tags,
                          options: ChipsChoiceOption.listFrom<String, String>(
                            source: options,
                            value: (i, v) => v,
                            label: (i, v) => v,
                          ),
                          onChanged: (val) => setState(() => tags = val),
                          isWrapped: true,
                        ),
                      ],
                    )),
                TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  decoration: new InputDecoration(
                    labelText: "About You",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(
                        color: Color(0xFFEE829C),
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Age cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 18,
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  decoration: new InputDecoration(
                    labelText: "Address",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(
                        color: Color(0xFFEE829C),
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val.length == 0) {
                      return "Address cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 18,
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }

  void uploadPhoto(BuildContext context, File file){
    Api().uploadPhoto(context: context, file: file).then((value) => {

    });
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            height: 30,
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Row(
              children: [
                Image.asset(
                  _item.text,
                  color: _item.isSelected ? Colors.white : Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                Center(
                  child: Text(_item.buttonText,
                      style: new TextStyle(
                          color: _item.isSelected ? Colors.white : Colors.black,
                          //fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                ),
              ],
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected ? Color(0xFFEE829C) : Colors.transparent,
              /*border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected
                      ? Color(0xFFEE829C)
                      : Colors.grey),*/
              borderRadius: const BorderRadius.all(const Radius.circular(20.0)),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}
