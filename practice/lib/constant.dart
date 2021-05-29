import 'package:flutter/material.dart';

///this . dart file is to save all of the constant value and color that is supposed to be in the file
const kPrimaryColor = Color(0xFFFFC200); //to be change color
const kGradientColor = BoxDecoration(
  gradient: const LinearGradient(
    colors: [
      Colors.lime,
      Colors.cyan,
    ],
    begin: FractionalOffset.topLeft,
    end: FractionalOffset.bottomRight,
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  ),
);
const kTextColor = Color(0x000000); //to be change color
//const kButtonColor = Color(0xFFFFC200); //to be change color
