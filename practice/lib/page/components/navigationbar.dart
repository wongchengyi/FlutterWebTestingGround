import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class navigationbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var raisedButton = RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        color: Colors.cyan,
        splashColor: Colors.redAccent,
        //highlightElevation: 5000, not needed ? doesnt seem to have obvious features
        onPressed: () {},
        child: Text(
          "Sign Up/Sign In".toUpperCase(),
          style: TextStyle(fontSize: 20),
        ));
    return Container(
      padding: EdgeInsets.all(20), //size
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.50),
            )
          ]),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/limelightlogo.png",
            height: 50,
            alignment: Alignment.topCenter,
          ),
          SizedBox(width: 5),
          Text(
            "Limelight".toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Navbaritems(
            title: "Home",
            press: () {},
          ),
          Navbaritems(
            title: "Courses",
            press: () {},
          ),
          Navbaritems(
            title: "Users",
            press: () {},
          ),
          Navbaritems(
            title: "About Us",
            press: () {},
          ),
          // ignore: deprecated_member_use
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: raisedButton,
          )
        ],
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
