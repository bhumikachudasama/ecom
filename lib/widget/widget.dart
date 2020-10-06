import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset(
      "assets/images/logo.png",
      height: 40,
    ),
    elevation: 0.0,
    centerTitle: false,
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.black87)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.black87)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.black87, fontSize: 16);
}

TextStyle bottomTextStyle() {
  return TextStyle(color: Colors.grey, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.black87, fontSize: 17);
}

TextStyle btnTextStyle() {
  return TextStyle(color: Colors.white);
}

TextStyle headerTextStyle() {
  return TextStyle(color: Colors.black87, fontSize: 25);
}

TextStyle fgtpwdTextStyle() {
  return TextStyle(color: Colors.blueAccent, fontSize: 16);
}
