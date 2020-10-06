import 'package:flutter/material.dart';
import 'package:chatapp/widget/widget.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Color(0xff1F1F1F),
        accentColor: Color(0xff007EF4),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
     Scaffold(
      appBar: appBarMain(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text("-:Developer Team:-",style: simpleTextStyle(),),
          Text("Bhumika Chudasama",style: simpleTextStyle(),),
          Text("Aayushi Patel",style: simpleTextStyle(),),
          Text("Aveksha Ranka",style: simpleTextStyle(),),
          Text("",style: simpleTextStyle(),),
          Text("",style: simpleTextStyle(),),
          Text("",style: simpleTextStyle(),),
          Text("",style: simpleTextStyle(),),
          Text("",style: simpleTextStyle(),),
          Text("",style: simpleTextStyle(),),
          Text("",style: simpleTextStyle(),),
          Text("",style: simpleTextStyle(),),
          Text("BAA Enterprise",style: simpleTextStyle(),),
          Text("Commited to serve premium products",style: simpleTextStyle(),),
        ],),),)
    );
  }
}