import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:virtualmarriageME/model/UserResponse.dart';
import 'package:virtualmarriageME/screens/EarningScreen.dart';
import 'package:virtualmarriageME/screens/HowToUse.dart';
import 'package:virtualmarriageME/screens/fragment/CallListScreen.dart';
import 'package:virtualmarriageME/screens/fragment/ChatListScreen.dart';
import 'package:virtualmarriageME/screens/fragment/ProfileScreen.dart';
import 'package:virtualmarriageME/screens/leftpanel/AboutUsScreen.dart';
import 'package:virtualmarriageME/screens/profile/SettingScreen.dart';
import 'package:virtualmarriageME/utils/PreferenceHelper.dart';

import 'chat/chat.dart';
import 'fragment/DashboardScreen.dart';
import 'login/LoginScreen.dart';
import 'wallet/WalletTransaction.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  UserData userData;

  @override
  void initState() {
    super.initState();

    PreferenceHelper.getUserProfile().then((value) => {
      setState(() {
        userData = value;
      })
    });
    registerUserWithFirebase();
  }

  Future<void> registerUserWithFirebase() async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: 'WpKGYBdPc8euGDQhkzcOpJd8XLI2')
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    if (documents.length == 0) {
      FirebaseFirestore.instance
          .collection('users')
          .doc('WpKGYBdPc8euGDQhkzcOpJd8XLI2')
          .set({
        'nickname': 'Soni Rawat',
        'photoUrl': 'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
        'id': 'WpKGYBdPc8euGDQhkzcOpJd8XLI2',
        'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
        'chattingWith': null
      });
    } else {
      print('User ${documents[0].data()['nickname']} with id ${documents[0].data()['id']} already exist.');
    }


  }


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) =>
      new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          key: _scaffoldKey,
          drawer: Drawer(child: leftDrawerMenu()),
          appBar: buildAppBar(context),
          bottomNavigationBar: buildBottomNavyBar(context),
          body: _getDrawerItemWidget(currentIndex),
        ),
      ),
    );
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new DashboardScreen();
      case 1:
        return new CallListScreen();
      case 2:
        return new ChatListScreen();
      case 3:
        return new ProfileScreen();
      default:
        return new Text("Error");
    }
  }

  BottomNavyBar buildBottomNavyBar(BuildContext context) {
    return BottomNavyBar(
      selectedIndex: currentIndex,
      showElevation: true,
      onItemSelected: (index) =>
          setState(() {
            currentIndex = index;
          }),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          textAlign: TextAlign.center,
          activeColor: Color(0xFFEE829C),
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.call),
            title: Text('Call History'),
            textAlign: TextAlign.center,
            activeColor: Color(0xFFEE829C)),
        BottomNavyBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            title: Text('Chat History'),
            textAlign: TextAlign.center,
            activeColor: Color(0xFFEE829C)),
        BottomNavyBarItem(
            icon: Icon(Icons.person_add_alt_1_outlined),
            title: Text('Profile'),
            textAlign: TextAlign.center,
            activeColor: Color(0xFFEE829C)),
      ],
    );
  }


  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Virtual Marriage",
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
      leading: new IconButton(
          icon: new Icon(Icons.menu,  color: Color(0xFFEE829C)),
          onPressed: () => _scaffoldKey.currentState.openDrawer()),
      actions: <Widget>[
        /*IconButton(
          icon: Icon(Icons.share,
          ),
          color: Colors.black,
          onPressed: () {
            *//*Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: ShoppingCart(true),
              ),
            );*//*
          },
        ),*/
      ],
      backgroundColor: Colors.white,
    );
  }

  leftDrawerMenu() {
    Color blackColor = Colors.black.withOpacity(0.6);
    return Scaffold(
          body: SafeArea(
            child:  SingleChildScrollView(
              child: Container(
                //color: Color(0xffffffe4),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/girl_image.png"),
                            backgroundColor: Colors.grey,
                            radius: 60,

                          ),
                          SizedBox(height: 10,),
                          Text('${userData.name}',
                              style: TextStyle(fontSize: 18, color: Colors.black)),
                          Text("+91 ${userData.mobile}",
                              style: TextStyle(fontSize: 14, color: Colors.black)),

                        ],
                      ),
                    ),
                    Container(
                      child: Divider(color:Color(0xFFEE829C), thickness: 1,),
                    ),

                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => WalletTransaction(),),);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children:<Widget> [
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => EarningScreen(),),);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children:<Widget> [
                                      Icon(Icons.monetization_on,
                                        color: Color(0xFFEE829C),),
                                      SizedBox(width: 10,),
                                      Flexible(
                                        child: Text("Total Transactions",
                                            maxLines: 2,
                                            style: TextStyle(fontSize: 14, color: Colors.black)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  alignment: Alignment.topRight,
                                  child: Text("0.0",
                                    style: TextStyle(fontSize: 14, color: Colors.black),)
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children:<Widget> [
                          Icon(Icons.chat, color: Colors.blue,),
                          SizedBox(width: 10,),
                          Text("Customer Chat Support",
                              style: TextStyle(fontSize: 14, color: Colors.black)),
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => SettingScreen(),),);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children:<Widget> [
                            Icon(Icons.settings,
                              color: Color(0xFFEE829C),),
                            SizedBox(width: 10,),
                            Text("Settings",
                                style: TextStyle(fontSize: 14, color: Colors.black)),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children:<Widget> [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: InkWell(
                                onTap: (){
                                  openWebsite(context);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children:<Widget> [
                                    Icon(Icons.web,
                                      color:Colors.green,),
                                    SizedBox(width: 10,),
                                    Text("Website ",
                                        style: TextStyle(fontSize: 14, color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: InkWell(
                                onTap: (){
                                  openVMBlog(context);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children:<Widget> [
                                    Icon(Icons.beenhere,
                                      color: Colors.deepOrange,),
                                    SizedBox(width: 10,),
                                    Text("Blogs ",
                                        style: TextStyle(fontSize: 14, color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children:<Widget> [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => HowToUse(),),);
                                },

                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children:<Widget> [
                                    Icon(Icons.event_note,
                                      color: Colors.black,),
                                    SizedBox(width: 10,),
                                    Text("How to use ",
                                        style: TextStyle(fontSize: 14, color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => AboutUsScreen(),),);
                              },
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children:<Widget> [
                                    Icon(Icons.info,
                                      color: Colors.black,),
                                    SizedBox(width: 10,),
                                    Text("About Us ",
                                        style: TextStyle(fontSize: 14, color: Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children:<Widget> [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children:<Widget> [
                                  Icon(Icons.rate_review,
                                    color: Colors.black,),
                                  SizedBox(width: 10,),
                                  Text("Rate Us",
                                      style: TextStyle(fontSize: 14, color: Colors.black)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children:<Widget> [
                                  Icon(Icons.share,
                                    color: Color(0xFFEE829C),),
                                  SizedBox(width: 10,),
                                  Text("Share Us ",
                                      style: TextStyle(fontSize: 14, color: Colors.black)),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          PreferenceHelper.clearPreference();
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen()), (Route<dynamic> route) => false);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children:<Widget> [
                            Icon(Icons.logout, color: Colors.black,),
                            SizedBox(width: 10,),
                            Text("Logout", style: TextStyle(fontSize: 14, color: Colors.black)),
                          ],
                        ),
                      ),
                    ),

                    Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child:Text('Also availble on', style: TextStyle(fontSize: 14, color: Colors.black))
                    ),

                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget> [
                          //AssetImage("assets/girl_image.png")
                          IconButton(
                            icon: new Image.asset('assets/leftpanel/ic_facebook.png',
                            width: 20, height: 20,),
                            tooltip: 'Closes application',
                            onPressed: () {
                              openSocialWebsite(context ,"https://www.facebook.com/vm.singh.54943");
                              }
                          ),
                          IconButton(
                              icon: new Image.asset('assets/leftpanel/ic_youtube.png',
                                width: 20, height: 20,),
                              tooltip: 'Closes application',
                              onPressed: () {
                                openSocialWebsite(context ,"https://www.youtube.com/");
                              }
                          ),
                          IconButton(
                              icon: new Image.asset('assets/leftpanel/ic_twitter.png',
                                width: 20, height: 20,),
                              tooltip: 'Closes application',
                              onPressed: () {
                                openSocialWebsite(context ,"https://twitter.com/MarriageVirtual");
                              }
                          ),
                          IconButton(
                              icon: new Image.asset('assets/leftpanel/ic_linkedin.png',
                                width: 20, height: 20,),
                              tooltip: 'Closes application',
                              onPressed: () {
                                openSocialWebsite(context ,"https://www.linkedin.com/in/virutal-marriage-55a03b1bb/");
                              }
                          ),
                          IconButton(
                              icon: new Image.asset('assets/leftpanel/ic_instagram.png',
                                width: 20, height: 20,),
                              tooltip: 'Closes application',
                              onPressed: () {
                                openSocialWebsite(context ,"https://www.instagram.com/virtualmarriage/");
                              }
                          ),
                          IconButton(
                              icon: new Image.asset('assets/leftpanel/ic_pinterest.png',
                                width: 20, height: 20,),
                              tooltip: 'Closes application',
                              onPressed: () {
                                openSocialWebsite(context ,"https://in.pinterest.com/infovirtualmarriage/_saved/");
                              }
                          ),


                        ],
                      ),
                    ),

                    Container(
                        margin: EdgeInsets.all(0),
                        child:Text('Follow us & we will follow you back :)',
                            style: TextStyle(fontSize: 14, color: Colors.black))
                    ),

                    Container(
                        margin: EdgeInsets.all(20),
                        child:Text('Version: 1.0.0',
                            style: TextStyle(fontSize: 16, color: Colors.green))
                    ),

                  ],
                ),
              ),
            ),
          )

          );
  }

  void openSocialWebsite(BuildContext context, String url) async {
    try {
      await launch(url,
        option: new CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: new CustomTabsAnimation.slideIn(),
          extraCustomTabs: <String>[
            'org.mozilla.firefox',
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void openWebsite(BuildContext context) async {
    try {
      await launch('https://virtualmarriage.me',
        option: new CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: new CustomTabsAnimation.slideIn(),
          extraCustomTabs: <String>[
            'org.mozilla.firefox',
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void openVMBlog(BuildContext context) async {
    try {
      await launch('https://virtualmarriage.me/blog/',
        option: new CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: new CustomTabsAnimation.slideIn(),
          extraCustomTabs: <String>[
            'org.mozilla.firefox',
            'com.microsoft.emmx',
          ],
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _launchURL(BuildContext context) async {
    try {
      await launch(
        'https://indianrojgar.com/about-us/',
        option: new CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: new CustomTabsAnimation.slideIn(),
          // or user defined animation.
          /*animation:  CustomTabsAnimation(
          startEnter: 'slide_up',
          startExit: 'android:anim/fade_out',
          endEnter: 'android:anim/fade_in',
          endExit: 'slide_down',
        ),*/
        extraCustomTabs: <String>[
          // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
          'org.mozilla.firefox',
          // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
          'com.microsoft.emmx',
        ],
      ),
    );
    } catch (e) {
    // An exception is thrown if browser app is not installed on Android device.
    debugPrint(e.toString());
    }
  }


}


