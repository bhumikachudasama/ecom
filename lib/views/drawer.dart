import 'package:chatapp/views/support.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:chatapp/widget/widget.dart';
import 'package:chatapp/services/productholder.dart';
import 'package:chatapp/helper/authenticate.dart';
import 'package:chatapp/helper/constants.dart';
import 'package:chatapp/helper/helperfunctions.dart';
import 'package:chatapp/helper/theme.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/views/chat.dart';
import 'package:chatapp/views/search.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/views/drawer.dart';
import 'account.dart';
import 'cart.dart';
import 'order.dart';
import 'notifications.dart';
import 'offer.dart';
import 'about.dart';
import 'support.dart';
import 'dart:convert';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatapp/main.dart';


class MainDrawer extends StatelessWidget {

Future<void> cencal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('intvalue');

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top:90,
          ),
          child:Column(
            children: <Widget>[
                ListTile(leading: Icon(Icons.person),
                   title: Text('My Account',style: TextStyle(fontSize: 18
                   ),
                   ),
                   onTap: (){Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AccountScreen()
              ));},
                   ),
                   ListTile(leading: Icon(Icons.shopping_cart),
                   title: Text('My cart',style: TextStyle(fontSize: 18
                   ),
                   ),
                   onTap: (){Navigator.push(context, MaterialPageRoute(
                  builder: (context) => CartScreen()
              ));},
                   ),
        ListTile(leading: Icon(Icons.card_giftcard),
                   title: Text('My Orders',style: TextStyle(fontSize: 18
                   ),
                   ),
                   onTap: (){Navigator.push(context, MaterialPageRoute(
                  builder: (context) => OrderScreen()
              ));},
                   ),
      ListTile(leading: Icon(Icons.notifications_active),
                   title: Text('My notifications',style: TextStyle(fontSize: 18
                   ),
                   ),
                   onTap: (){Navigator.push(context, MaterialPageRoute(
                  builder: (context) => NotificationScreen()
              ));},
                   ),
      ListTile(leading: Icon(Icons.shopping_basket),
                   title: Text('offer Zone',style: TextStyle(fontSize: 18
                   ),
                   ),
                   onTap: (){Navigator.push(context, MaterialPageRoute(
                  builder: (context) => OfferScreen()
              ));},
                   ),
       ListTile(leading: Icon(Icons.supervised_user_circle),
                   title: Text('About us',style: TextStyle(fontSize: 18
                   ),
                   ),
                   onTap: (){Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AboutScreen()
              ));},
                   ),
       ListTile(leading: Icon(Icons.record_voice_over),
                   title: Text('Contact us',style: TextStyle(fontSize: 18
                   ),
                   ),
                   onTap: (){Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SupportScreen()
              ));},
                   ),
      ListTile(leading: Icon(Icons.exit_to_app),
                   title: Text('sign out',style: TextStyle(fontSize: 18
                   ),
                   ),
                   onTap: (){
                     cencal();
                     AuthService().signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyApp()));},
                   ),
                  SizedBox.fromSize(
                       size: Size.fromHeight(95),
                   ),
      
                   Container(
                                      // margin: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                                    height: 100,
                                    width: 100,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                      image: new AssetImage("assets/images/baa_logo.png"),
                                      fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
            ],
          ),
        ),
        
        
      ],
      ),
    );
  }
}