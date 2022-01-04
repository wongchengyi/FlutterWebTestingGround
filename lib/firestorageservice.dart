import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService() {
    initializeApp(
        apiKey: "AIzaSyAgwW2AhVfJwzv3eyGWSstJNrMIZYZw5mI",
        authDomain: "webapplicationtest-e8d7a.firebaseapp.com",
        projectId: "webapplicationtest-e8d7a",
        storageBucket: "webapplicationtest-e8d7a.appspot.com",
        messagingSenderId: "236369501192",
        appId: "1:236369501192:web:c6532179cbbc011c7e45bd");
  }

  static Future<dynamic> loadFromStorage(
      BuildContext context, String image) async {
    var url = await storage().ref(image).getDownloadURL();
    return url;
  }
}
