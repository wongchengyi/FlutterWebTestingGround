import 'package:flutter/material.dart';

class scrollbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Scrollbar(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text("Item: ${index + 1}"),
                      ));
                    }))),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

class scrollbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Scrollbar(
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text("Item: ${index + 1}"),
                      ));
                    }))),
      ),
    );
  }
}

 */
