import 'dart:typed_data';
import 'package:chatapp/views/cart.dart';
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
import 'favourite.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ChatRoom extends StatefulWidget{
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  Widget makeProductGrid(){
      return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context,int index){
              return ProductGridItem(index+1);
                
            }
      );
  }
  var listItem= ListView.builder(
                  shrinkWrap: true,
                  itemCount:13,
                  itemBuilder: (BuildContext context,int index){
              return Container(
                child: Column( children: <Widget>[
                   index==0?Container(
                     child:Column(
                       children: [
                         SizedBox(height: 18.0,),
                         CarouselSlider(items: [
                    
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: AssetImage('assets/images/index_7.jpg'),fit: BoxFit.cover),
            ),),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: AssetImage('assets/images/index_6.jpg'),fit: BoxFit.cover),
            ),),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: AssetImage('assets/images/index_1.jpg'),fit: BoxFit.cover),
            ),),
            
        ],
         options: CarouselOptions(aspectRatio: 16/9,height: 180.0,enlargeCenterPage: true,autoPlay: true,autoPlayCurve: Curves.fastLinearToSlowEaseIn,enableInfiniteScroll: true,autoPlayAnimationDuration: Duration(milliseconds: 800),viewportFraction: 0.8,)),
                      SizedBox(height: 18.0,),
                       ],
                     ),
                   ):Container(),
                    
                  index%2==0? Row(
                      children: [
                         Expanded(
                           child: Container(
                          height: 150,
                                decoration: BoxDecoration(

                                ),
                          child:ProductGridItem(index+1), 
                        ),
                      
                         ),
                          Expanded(
                           child: Container(
                          height: 150,
                                decoration: BoxDecoration(

                                ),
                          child:ProductGridItem(index+2), 
                        ),
                          ),
                       
                       /* Expanded(
                          child:ProductGridItem(index+1), 
                        ),
                        Expanded(
                          child:ProductGridItem(index+2), 
                        ),*/
                      ],
                    ):Container(),
                    
                ],),
              );
                
            }
      );
  /* Widget makeProductGrid(){
      return GridView.builder(
        shrinkWrap: true,
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2), itemBuilder: (context,index){
          return Container(
            child:Column(
              children: [
                index==0?carousal():Container(),
                ProductGridItem(index+1),
              ],
            ),
          );
          
      });
  }*/


  Widget carousal() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        SizedBox(height: 25.0,),
        CarouselSlider(items: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: AssetImage('assets/images/index_7.jpg'),fit: BoxFit.cover),
            ),),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: AssetImage('assets/images/index_6.jpg'),fit: BoxFit.cover),
            ),),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(image: AssetImage('assets/images/index_1.jpg'),fit: BoxFit.cover),
            ),)
        ],
         options: CarouselOptions(aspectRatio: 16/9,height: 180.0,enlargeCenterPage: true,autoPlay: true,autoPlayCurve: Curves.fastLinearToSlowEaseIn,enableInfiniteScroll: true,autoPlayAnimationDuration: Duration(milliseconds: 800),viewportFraction: 0.8,))
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'FlutterChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        //scaffoldBackgroundColor: Color(0xff1F1F1F),
        //accentColor: Color(0xff007EF4),
        fontFamily: "OverpassRegular",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: 
    Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png",
        height: 40,),
        elevation: 0.0,
        centerTitle: false,
       /* actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Search()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.search)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavouriteScreen()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.favorite)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.shopping_cart)),
          ),
        ],*/
      ),
      //drawer: MainDrawer(),
      body:listItem,
        //child: makeProductGrid(),
        //child: carousal(),
     
      
          /*Column(children: [
          //carousal(),
          SizedBox(height: 18.0,),
          makeProductGrid(),
        ],),*/
      
        
    ),
    );
  }
}



class ProductGridItem extends StatefulWidget{
  
  int _index;

  ProductGridItem(this. index);
    int index;

  @override
  _ProductGridItemState createState() => _ProductGridItemState(index);
}

class _ProductGridItemState extends State<ProductGridItem>{
_ProductGridItemState(index);
  Uint8List imageFile;

  StorageReference photoref = FirebaseStorage.instance.ref().child("productpic");

  getProducts(){

    if(!requestedIndexes.contains(widget.index)){
     int MAX_SIZE = 7*1024*1024;
     print(widget.index);

    photoref.child("index_${widget.index.toString()}.jpg").getData(MAX_SIZE).then((data) {
    
    this.setState(() {imageFile = data;});
      productdata.putIfAbsent(widget.index, () {return data;});
    }).catchError((error){

    }); 
    requestedIndexes.add(widget.index);
    }

  }

  Widget productGridTitleWidget(){
    if(imageFile == null){
      return Center(child: Text("No Products"),);
    } else{
      return Image.memory(imageFile,fit: BoxFit.cover);
    }
  }

  @override
  void initState(){
    super.initState();
    if(!productdata.containsKey(widget.index)){
      getProducts();
    }else{
      this.setState(() {imageFile = productdata[widget.index];});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(child: productGridTitleWidget(),);
  }
}