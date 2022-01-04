import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NewScreen extends StatelessWidget {
  static String routeName = "/new-screen";

  int count = 0;
  void _addImagesFile() {
    var storage = FirebaseStorage.instance;
    List<String> listOfImage = [
      'assets/Images/avatar.png',
      'assets/Images/background.png',
      'assets/Images/glap.png',
      'assets/Images/loader.png',
      'assets/Images/logo-dark.png',
      'assets/Images/logo-white.png',
    ];
    listOfImage.forEach((img) async {
      String imageName = img
          .substring(img.lastIndexOf("/"), img.lastIndexOf("."))
          .replaceAll("/", "");

      String path = img.substring(img.indexOf("/") + 1, img.lastIndexOf("/"));
      print('assets/' + path);
      final Directory systemTempDir = Directory.systemTemp;
      final byteData = await rootBundle.load(img);
      final file = File('${systemTempDir.path}/$imageName.jpeg');
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      TaskSnapshot taskSnapshot =
          await storage.ref('$path/$imageName').putFile(file);
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection(path)
          .add({"url": downloadUrl, "name": imageName});
      count++;
      print(count);
    });
    print('finished.............');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addImagesFile,
      ),
      appBar: AppBar(
        title: Text('Adding images'),
      ),
      body: Center(
        child: Text('Adding Images to Firebase'),
      ),
    );
  }
}
