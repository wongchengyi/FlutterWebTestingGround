import 'package:flutter/material.dart';
import 'package:practice/constant.dart';
import 'package:practice/page/components/SideDrawer.dart';

import 'firstmenupage.dart';

class badgesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var boxShadow = BoxShadow(
      color: Colors.grey,
      blurRadius: 2.0,
      spreadRadius: 2.0,
    );
    var fontThemeTitle = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        );
    var fontTheme = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 15.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        );
    Size size = MediaQuery.of(context).size;
    //var dividerHeight = size.height * 0.8;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text(
          "Badges".toUpperCase(),
          style: fontThemeTitle,
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
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: Container(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: kGradientColor,
          alignment: Alignment.center,
          child: Container(
            height: size.height * 0.8,
            width: size.width * 0.9,
            //alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0)),
            //margin: EdgeInsets.all(20.0),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 7,
                      child: Container(
                        padding: EdgeInsets.all(50),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image(
                                  alignment: Alignment.topLeft,
                                  height: 75,
                                  width: 75,
                                  image: AssetImage('assets/images/badges.png'),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    buildText1(fontTheme, "Master Badges"),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 25)),
                                    Text("Master Badges show..."),
                                    Padding(padding: EdgeInsets.all(25)),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 75,
                              child: ListView(
                                //shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Container(
                                    width: 160.0,
                                    color: Colors.transparent,
                                    child: buildTextImageButtons(fontTheme,
                                        "Badge1", 'assets/images/badges.png'),
                                  ),
                                  Container(
                                    width: 160.0,
                                    color: Colors.transparent,
                                    child: buildTextImageButtons(fontTheme,
                                        "Badge1", 'assets/images/badges.png'),
                                  ),
                                  Container(
                                    width: 160.0,
                                    color: Colors.transparent,
                                    child: buildTextImageButtons(fontTheme,
                                        "Badge1", 'assets/images/badges.png'),
                                  ),
                                  Container(
                                    width: 160.0,
                                    color: Colors.transparent,
                                    child: buildTextImageButtons(fontTheme,
                                        "Badge1", 'assets/images/badges.png'),
                                  ),
                                  Container(
                                    width: 160.0,
                                    color: Colors.transparent,
                                    child: buildTextImageButtons(fontTheme,
                                        "Badge1", 'assets/images/badges.png'),
                                  ),
                                  Container(
                                    width: 160.0,
                                    color: Colors.transparent,
                                    child: buildTextImageButtons(fontTheme,
                                        "Badge1", 'assets/images/badges.png'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: VerticalDivider(
                        color: Colors.black.withOpacity(0.5),
                        thickness: 1,
                      )),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(50),
                      //color: Colors.green, //to show the size of container
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          buildFlatButton(fontTheme, "Master Badges"), //item 1
                          buildFlatButton(fontTheme, "Midway Badges"), //item 2
                          buildFlatButton(fontTheme, "Mini Badges"), //item 3
                          Divider(
                            color: Colors.black.withOpacity(0.5),
                            thickness: 1,
                          ),
                          buildFlatButton(fontTheme, "My Progress"), //item 3
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  FlatButton buildFlatButton(TextStyle fontTheme, String text) {
    return FlatButton(
        onPressed: () {},
        child: Text(
          text,
          style: fontTheme,
        ));
  }

  Widget buildText1(TextStyle fontTheme, String textItem) {
    return Text(
      textItem,
      textAlign: TextAlign.left,
      style: fontTheme,
    );
  }

  ElevatedButton buildTextImageButtons(
      TextStyle fontTheme, String textItems, String picURL) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        elevation: MaterialStateProperty.all(10),
      ),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Image(
              alignment: Alignment.topLeft,
              height: 50,
              width: 50,
              image: AssetImage(picURL),
            ),
            Text(
              textItems,
              textAlign: TextAlign.center,
              style: fontTheme,
            ),
          ],
        ),
      ),
    );
  }
}
