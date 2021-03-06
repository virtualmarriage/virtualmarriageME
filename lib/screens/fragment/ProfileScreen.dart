import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:virtualmarriageME/model/UserResponse.dart';
import 'package:virtualmarriageME/screens/profile/EditProfileScreen.dart';
import 'package:virtualmarriageME/services/Api.dart';
import 'package:virtualmarriageME/utils/PreferenceHelper.dart';
import 'package:virtualmarriageME/utils/chips_choice.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  UserData userData;

  @override
  initState() {
    super.initState();

    getProfile();

    PreferenceHelper.getUserProfile().then((value) => {
      setState(() {
        userData = value;
      })
    });
  }

  int tag = 1;
  List<String> tags = [];
  List<String> options = [
    'Bidi', 'Daru', 'Hukkka',
    'Hot Chat', 'Ghoomana', 'Trip',
    'Outing', 'Travel', 'Food', 'Coffee',
    'Meeting',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              //color: Color(0xffffffe4),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            'https://placeimg.com/640/480/any5',
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(5),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            'https://placeimg.com/640/480/any8',
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(5),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            'https://placeimg.com/640/480/any',
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(5),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            'https://placeimg.com/640/480/any3',
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(5),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            'https://placeimg.com/640/480/any2',
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(5),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.network(
                            'https://placeimg.com/640/480/any1',
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(5),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name', style: TextStyle(
                                  fontSize: 14, color: Color(0xFFEE829C)
                              ),),
                              Text('${userData.name}', style: TextStyle(
                                  fontSize: 18, color: Colors.black
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Age (in year)', style: TextStyle(
                                  fontSize: 14, color: Color(0xFFEE829C)
                              ),),
                              Text('${userData.age}', style: TextStyle(
                                  fontSize: 18, color: Colors.black
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Gender', style: TextStyle(
                                  fontSize: 14, color: Color(0xFFEE829C)
                              ),),
                              Text('${userData.gender}', style: TextStyle(
                                  fontSize: 18, color: Colors.black
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Card(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Interest", style: TextStyle(
                                fontSize: 14, color: Color(0xFFEE829C))),
                            ChipsChoice<String>.multiple(
                              value: tags,
                              options: ChipsChoiceOption.listFrom<
                                  String,
                                  String>(
                                source: options,
                                value: (i, v) => v,
                                label: (i, v) => v,
                              ),
                              onChanged: (val) => setState(() => tags = val),
                              isWrapped: true,
                            ),
                          ],
                        )

                    ),
                  ),

                  SizedBox(height: 10,),
                  Card(
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('About Me', style: TextStyle(
                                fontSize: 14, color: Color(0xFFEE829C)
                            ),),

                            Text('${userData.aboutus}',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal)),

                          ],


                        ),
                      ),
                    ),
                  ),

                  /*SizedBox(height: 10,),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('I like to talk.', style: TextStyle(
                                  fontSize: 14, color: Color(0xFFEE829C)
                              ),),
                              Text('Man', style: TextStyle(
                                  fontSize: 18, color: Colors.black
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
*/
                  SizedBox(height: 10,),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Address', style: TextStyle(
                                  fontSize: 14, color: Color(0xFFEE829C)
                              ),),
                              Text('${userData.address}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black
                                ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 60,),

                ],
              ),
            ),
          ),
        ),

        floatingActionButton: FloatingActionButton.extended(
          label: Text('Edit' , style: TextStyle(fontSize: 16),),
          icon: Icon(Icons.edit),
          backgroundColor: new Color(0xFFE57373),
          foregroundColor: Colors.white,
          tooltip: 'Edit Profile',
          onPressed: () => {
          Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => EditProfileScreen(),
          ),
          ),
        },
        )


    );
  }

  void getProfile(){
    Api().getProfile(context: context).then((value) => {
      if(value.status && value.data!= null) {
        PreferenceHelper.saveProfileData(value.data),
        print("show data in views-----")
      }
    });
  }

}


