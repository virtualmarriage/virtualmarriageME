import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreen createState() => _AboutUsScreen();
}

class _AboutUsScreen extends State<AboutUsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
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
          image: DecorationImage(image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
        ),
        child: Column(
            children: [

              Card(
                child: Container(

                    width: double.infinity,
                    margin: EdgeInsets.all(10),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      Text("About", style: TextStyle(fontSize: 18, color: Colors.black),),
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: TextStyle(fontSize: 14, color: Colors.black),),
                        SizedBox(height: 20,),
                        Text("Address", style: TextStyle(fontSize: 18, color: Colors.black),),
                        Text("Santi Vihar, West Delhi, PIN-202020", style: TextStyle(fontSize: 14, color: Colors.black),),
                        SizedBox(height: 20,),
                        Text("Email Id", style: TextStyle(fontSize: 18, color: Colors.black),),
                        Text("help@virtualmarriage.me", style: TextStyle(fontSize: 14, color: Colors.black),),
                        SizedBox(height: 20,),
                        Text("Telephone", style: TextStyle(fontSize: 18, color: Colors.black),),
                        Text("+91 9999-11-5555", style: TextStyle(fontSize: 14, color: Colors.black),),
                        SizedBox(height: 20,),
                        Text("Skype Id", style: TextStyle(fontSize: 18, color: Colors.black),),
                        Text("virtualmarriage", style: TextStyle(fontSize: 14, color: Colors.black),),
                      ],
                    )
                ),

              ),

              SizedBox(height: 20,),



            ]
        ),
      ),

    );
  }
}
