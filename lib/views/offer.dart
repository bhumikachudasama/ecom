import 'package:flutter/material.dart';
import 'package:chatapp/widget/widget.dart';

class OfferScreen extends StatelessWidget {
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
          Text("Work in Progress",style: simpleTextStyle(),),
          Icon(Icons.cloud_off,color: Colors.white,size:40 ),
        ],),),)
    );
  }
}