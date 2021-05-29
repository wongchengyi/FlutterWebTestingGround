import 'package:flutter/material.dart';
import 'package:practice/constant.dart';
import 'package:practice/page/firstmenupage.dart';
import 'package:practice/page/homepage.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Practice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:
            kPrimaryColor, //setting up those constant values(colors, text and etc)
      ),
      home: firstmenupage(), //the class name
      //homepage(), //callling the homepage.dart to load the initial page
    );
  }
}
