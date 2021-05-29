import 'package:flutter/material.dart';
import 'package:practice/page/homepage.dart';
import 'package:practice/page/components/SideDrawer.dart';
import 'dart:io' show Platform;

class firstmenupage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //getting the size of the browser the device is running
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: new FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => homepage()),
            );
          },
          child: new Center(
            child: new Text(
              "Welcome To \n   LimeLight".toUpperCase(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class Navbaritems extends StatelessWidget {
  final String title;
  final Function press;
  const Navbaritems({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
