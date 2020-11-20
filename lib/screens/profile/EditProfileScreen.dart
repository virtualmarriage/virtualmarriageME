import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:virtualmarriageME/utils/chips_choice.dart';
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
                              act: () => {_showPicker(context, 1)},
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
                        act: () => {_showPicker(context, 2)},
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
                      child: PlaceHolder(
                        act: null,
                      ),
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
                      child: PlaceHolder(
                        act: null,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: PlaceHolder(
                        act: null,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: PlaceHolder(
                        act: null,
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Color(0xffffffff),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text("Enter your full name.",
                          style: new TextStyle(
                            fontSize: 16,
                          )),
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
                        height: 10,
                      ),
                      Text("Enter your Age.",
                          style: new TextStyle(
                            fontSize: 16,
                          )),
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
                ),
                Container(
                    height: 100,
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
                            child: new RadioItem(ganderData[index]),
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
                Text("Tell us about yourself",
                    style: new TextStyle(
                      fontSize: 16,
                    )),
                TextFormField(
                  minLines: 1,
                  maxLines: 5,
                  decoration: new InputDecoration(
                    labelText: "About",
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
                Text("Like to talk.",
                    style: new TextStyle(
                      fontSize: 16,
                    )),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text("Add your full address.",
                    style: new TextStyle(
                      fontSize: 16,
                    )),
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

  void _showPicker(context, int position) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _pickImage(ImageSource.gallery).then((value) => {
                          setState(() {
                            if(position ==1) {
                              imageFile1 = value;
                            } else if(position ==2) {
                              imageFile2 = value;
                            }
                          }),
                          value = null
                        });
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _pickImage(ImageSource.camera).then((value) => {
                        setState(() {
                          if(position ==1) {
                            imageFile1 = value;
                          } else if(position ==2) {
                            imageFile2 = value;
                          }
                        })
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<File> _pickImage(ImageSource imageSource) async {
    var pickedFile = await ImagePicker().getImage(source: imageSource);
    File imageFile = File(pickedFile.path);

    if (imageFile != null) {
      imageFile = await _cropImage(imageFile);
      return imageFile;
    }
    return null;
  }

  Future<File> _cropImage(File imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Cropper',
        ));
    if (croppedFile != null) {
      final dir = await path_provider.getTemporaryDirectory();
      final targetPath = dir.absolute.path + "/temp.jpg";
      final imgFile = await compressAndGetFile(imageFile, targetPath);

      return imgFile;
    }
    return null;
  }

  Future<File> compressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 88,
      rotate: 0,
    );

    print(file.lengthSync());
    print(result.lengthSync());

    return result;
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(10.0),
      alignment: Alignment.center,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            alignment: Alignment.topCenter,
            height: 50.0,
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              children: [
                Image.asset(
                  _item.text,
                  color: _item.isSelected ? Colors.white : Colors.black,
                ),
                SizedBox(
                  width: 5,
                ),
                new Center(
                  child: new Text(_item.buttonText,
                      style: new TextStyle(
                          color: _item.isSelected ? Colors.white : Colors.black,
                          //fontWeight: FontWeight.bold,
                          fontSize: 18.0)),
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
          /*new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Text(_item.text),
          )*/
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
