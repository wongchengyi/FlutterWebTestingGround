import 'dart:html';

import 'package:flutter/material.dart';
import 'package:practice/constant.dart';
import 'package:practice/page/components/courseboxes.dart';
import 'package:practice/page/components/navigationbar.dart';
import 'package:practice/page/components/scrollbar.dart';
import 'package:practice/page/homepage.dart';
import 'package:practice/page/testingpage.dart';
import 'package:practice/page/calendarPage.dart';
import 'package:practice/page/badgesPage.dart';

class SideDrawer extends StatelessWidget {
  final Padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        padding: EdgeInsets.zero,
        //color of drawer?
        //color: Color(0xBFFF00),
        child: ListView(
          //1st property in the side drawer
          children: <Widget>[
            DrawerHeader(
              decoration: kGradientColor,
              child: Text(
                "USER PROFILE".toUpperCase(),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),
            //method for listing out "properties in the sidedrawer"
            buildMenuItem(
              text: "Calendar", //change text
              icon: Icons.perm_contact_calendar_outlined, //change logo
              onClicked: () => SelectedItem(context, 0),
            ),
            //2nd property
            const SizedBox(height: 48),
            //method for listing out "properties in the sidedrawer"
            buildMenuItem(
              text: 'Badges', //change text
              icon: Icons.badge_outlined, //change logo
              //ImageIcon: AssetImage('practice/assets/images/badges.png'),
              onClicked: () => SelectedItem(context, 1),
            ),
            //3rd property
            const SizedBox(height: 48),
            //method for listing out "properties in the sidedrawer"
            buildMenuItem(
              text: '1', //change text
              icon: Icons.people, //change logo
              onClicked: () => SelectedItem(context, 2),
            ),
            //4th property
            //2nd property
            const SizedBox(height: 48),
            //method for listing out "properties in the sidedrawer"
            buildMenuItem(
              text: '1', //change text
              icon: Icons.people, //change logo
              onClicked: () => SelectedItem(context, 3),
            ),
          ],
        ),
      ),
    );
  }

  //default flutter icon widget method
  Widget buildMenuItem({
    required String text,
    icon,
    ImageIcon,
    onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.lime;

    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  SelectedItem(BuildContext context, int i) {
    switch (i) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => calendarPage(), //can customize directed page
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => badgesPage(), //can customize directed page
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => testingpage(), //can customize directed page
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => testingpage(), //can customize directed page
        ));
        break;
    }
  }
}
