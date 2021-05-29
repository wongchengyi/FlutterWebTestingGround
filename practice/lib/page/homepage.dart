import 'dart:html';

import 'package:flutter/material.dart';
import 'package:practice/constant.dart';
import 'package:practice/main.dart';
import 'package:practice/page/components/SideDrawer.dart';
import 'package:practice/page/components/courseboxes.dart';
import 'package:practice/page/components/navigationbar.dart';
import 'package:practice/page/components/scrollbar.dart';

import 'package:practice/page/firstmenupage.dart';

class homepage extends StatelessWidget {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    //getting the size of the browser the device is running
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: SideDrawer(),
      ),
      appBar: AppBar(
        title: Text(
          "Limelight".toUpperCase(),
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 20.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => firstmenupage()),
              );
            },
            icon: const Icon(Icons.backspace),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 100,
        /*leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            splashColor: Color(0x808080), //can change the effect of pressing it
            onPressed: () {},
          )
        ],*/
      ),
      body: Container(
          //main piece of code that the majority of the widgets will reside on
          //getting the size and width from mediaquery
          height: size.height,
          width: size.width,
          decoration: kGradientColor,
          child: Column()),
    );
  }
}

/*
height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                Colors.lime,
                Colors.cyan,
              ],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),*/
