import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreferenceScreen extends StatefulWidget {
  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  String radioItem = '';
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(false, 'Women', 'assets/icon_female.png'));
    sampleData.add(new RadioModel(false, 'Man', 'assets/icon_male.png'));
    sampleData.add(new RadioModel(false, 'Both', 'assets/icon_female.png'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Preference'),
          backgroundColor: Color(0xFFEE829C),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
            ),
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Looking for Virtual Marriage!',
                      style: TextStyle(
                          color: Color(0xFFEE829C),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
                Card(
                  child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: Center(
                        child:  new ListView.builder(
                          scrollDirection:  Axis.horizontal,
                          itemCount: sampleData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return new InkWell(
                              //highlightColor: Colors.red,
                              splashColor: Color(0xFFEE829C),
                              onTap: () {
                                setState(() {
                                  sampleData.forEach((element) => element.isSelected = false);
                                  sampleData[index].isSelected = true;
                                  if(index == 0){
                                    radioItem = "Women";
                                  }else if(index == 1){
                                    radioItem = "Man";
                                  }else if(index == 2){
                                    radioItem = "Both";
                                  }
                                });
                              },
                              child: new RadioItem(sampleData[index]),
                            );
                          },
                        ),
                      )
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Color(0xFFEE829C))
                      ),
                      textColor: Colors.white,
                      color: Color(0xFFEE829C),
                      child: Text('Continue',
                        style: TextStyle(fontSize: 22),),
                      onPressed: () {

                        print("pressed---$radioItem");
                      },
                    )),
              ],
            ))),
    );
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
                Image.asset(_item.text, color: _item.isSelected ? Colors.white : Colors.black,),
                SizedBox(width: 5,),
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
              color: _item.isSelected
                  ? Color(0xFFEE829C)
                  : Colors.transparent,
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
