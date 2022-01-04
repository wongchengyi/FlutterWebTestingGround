// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

//import 'dart:html';
import 'dart:io';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Firebase testing',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Firebase Testing Ground'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //var storge = FirebaseStorage.instance;
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        //color: Colors.lightGreenAccent,

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //show data fetched
            Row(
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width * 0.3,
                  color: Colors.yellow,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: StreamBuilder<QuerySnapshot>(
                      //stream is to use to locate the direction of the database in the firestore and to return back the snapshot
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .snapshots(),
                      builder: (
                        //BuildContext context,
                        BuildContext context,
                        //AsyncSnapshot an immuatable representation of the most recent interaction with an async computation
                        //QuerySnapshot an object that contains the results of the specific query
                        AsyncSnapshot<QuerySnapshot> snapshot,
                      ) {
                        if (snapshot.hasError) {
                          //return const Text("Data is present");
                          return Text("Something went wrong " +
                              snapshot.hasError.toString());
                          //return Text(snapshot.hasError.toString());
                        }
                        if (snapshot.connectionState ==
                                ConnectionState.waiting ||
                            !snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        final data = snapshot.requireData;
                        //requiredata a getter method to output/return the lastest data received from previous method/function and etc
                        return ListView.builder(
                            itemCount: data.size,
                            itemBuilder: (context, index) {
                              return Column(
                                children: <Widget>[
                                  //. docs is used to get a list of all the documents in the mentioned/particular snapshot
                                  //[index] is asking to return the document one at a time
                                  Text('ID: ${data.docs[index]['ID']}'),
                                  Text('name: ${data.docs[index]['name']}'),
                                  Text(
                                      'user type: ${data.docs[index]['user_type']}'),
                                  //Text('name: ${data.docs[index]['pic_url']}'),
                                ],
                              );
                            });
                      },
                    ),
                  ),
                ),
                FutureBuilder<Uri>(
                    future: downloadURL(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Container(
                        height: size.height * 0.3,
                        width: size.width * 0.3,
                        color: Colors.blue,
                        child: SizedBox(
                            height: size.height * 0.1,
                            width: size.width * 0.1,
                            child: Image.network(snapshot.data.toString())),
                      );
                    })
              ],
            ),

            //show text field
            Container(
              height: size.height * 0.5,
              width: size.width,
              //color: Colors.blueAccent,
              child: fetchingData(),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //_addImages();
                      print('show image button has been pressed');
                      Dialog(
                        child: Text("pressed"),
                      );
                    },
                    child: Text('show image'),
                  )
                  //onPressed: _addImages, child: Text('Show Image'))
                ],
              ),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Future<Uri> downloadURL() {
  return fb
      .storage()
      .refFromURL('gs://webapplicationtest-e8d7a.appspot.com')
      .child('badges.png')
      .getDownloadURL();
}

//line 166 and 174 method are in the same group
class fetchingData extends StatefulWidget {
  @override
  fetchingDataState createState() {
    return fetchingDataState();
  }
}

class fetchingDataState extends State<fetchingData> {
  //creating key to be used under Form Widget
  final _formKey = GlobalKey<FormState>();
  //creating variable to store data to be written into it
  var deletedID, refDeletedID;
  var ID;
  var name;
  var user_type;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    var updateDocRef = users.doc("TestID");
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.confirmation_number),
                  hintText: 'ID',
                  labelText: 'ID'),
              onChanged: (value) {
                ID = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.confirmation_number),
                  hintText: 'name',
                  labelText: 'name'),
              //getting the value of text field
              onChanged: (value) {
                name =
                    value; //assign value of text field to the mentioned variable above
              },
              validator: (value) {
                //check if the value is empty or missing
                if (value == null || value.isEmpty) {
                  return 'please enter text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.confirmation_number),
                  hintText: 'user type',
                  labelText: 'user type'),
              onChanged: (value) {
                user_type = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter text';
                }
                return null;
              },
            ),
            //textformfield to get Reference ID to delete stuff
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.confirmation_number),
                  hintText: 'Reference ID',
                  labelText: 'Reference ID'),
              onChanged: (value) {
                refDeletedID = value;
              },
              /*validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter text';
                }
                return null;
              },*/
            ),
            //SizedBox(height: size.height * 0.1),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Sending Data')));
                          users.add({
                            'ID': ID,
                            'name': name,
                            'user_type': user_type
                          }).then((value) {
                            deletedID = value.id;
                            print('the reference id is $deletedID');
                          }).catchError(
                              (error) => print('error occured: $error'));

                          /*AlertDialog(
                            title: Text('This is your reference ID $deletedID'),
                          );*/
                        }
                      },
                      child: Text('Upload data')),
                  //update data button
                  ElevatedButton(
                      onPressed: () {
                        print('update button has been pressed');
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Updating Data')));
                          updateDocRef.set({
                            'ID': ID,
                            'name': name,
                            'user_type': user_type
                          }).catchError(
                              (error) => print('error occured: $error'));
                        }
                      },
                      child: Text('Update data')),
                  ElevatedButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('users')
                            //insert document ID to delete
                            .doc(refDeletedID)
                            //.doc('qCRhgAwbUoyVToYpgOOK')
                            //.doc(deletedID)
                            .delete();
                      },
                      child: Text('Delete data')),
                ],
              ),
            ),
          ],
        ));
  }
}

//https://protocoderspoint.com/failed-to-load-network-image-flutter-web/