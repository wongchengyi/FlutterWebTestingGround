import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class courseboxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var column = Column(
      children: <Widget>[
        Text(
          "Courses".toUpperCase(),
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: Colors.black),
        child: column,
      ),
    );
  }
}

/*padding: EdgeInsets.all(20),
      child: Align(
        alignment: Alignment(1.0, 5.0),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.50),
            )
          ]),*/
