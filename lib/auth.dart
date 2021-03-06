import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class Authservice {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<User> user;
  Stream<Map<String, dynamic>> profile;

  VoidCallback voidCallback;
  DatabaseReference ref = FirebaseDatabase.instance.reference();
  String name = "Jimmy Yan";
  String userEmail = "jimmyyan1337@gmail.com";
  String header = "jimmyyan1337";
  List<String> recy_items = ["tin can", "plastic bottle", "glass bottle"];
  List<String> nonrecy_items = ["bottle cap", "straw"];
  List<String> recy_num = ['1', '2', '2'];
  List<String> nonrecy_num = ['2', '1'];
  int score = 100;
  int day = 2;

  Future<User> signIn12() async {
    GoogleSignInAccount guser = await _googleSignIn.signIn();
    GoogleSignInAuthentication gauth = await guser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gauth.accessToken,
      idToken: gauth.idToken,
    );
    UserCredential authResult = await _auth.signInWithCredential(credential);
    User user = authResult.user;
    // name = user.displayName;
    // userEmail = user.email.toString();
    // var array = userEmail.split("@");
    //header = array[0].toString();
    newUser();
    return user;
  }

  void getInfo() {
    DatabaseReference usersRef = ref.child(header);
    usersRef.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        if (key.toString() == 'Schedule') {
          day = int.parse(values.toString());
        }
        if (key.toString() == 'Score') {
          print(values.toString());
          score = int.parse(values.toString());
        }
        if (key.toString() == "Recyclable") {
          var temp = values;
          temp.forEach((k, v) {
            for (var i = 0; i < recy_items.length; i++) {
              if (k.toString() == recy_items[i]) {
                recy_num[i] = v.toString();
              }
            }
          });
        }
        if (key.toString() == 'Non-Recyclable') {
          var temp = values;
          temp.forEach((k, v) {
            for (var i = 0; i < nonrecy_items.length; i++) {
              if (k.toString() == nonrecy_items[i]) {
                nonrecy_num[i] = v.toString();
              }
            }
          });
        }
      });
    });
  }

  void newUser() {
    DatabaseReference usersRef = ref.child(header);
    usersRef.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      if (values == null) {
        usersRef.child('Alert').set("false");
        for (var i = 0; i < nonrecy_items.length; i++) {
          usersRef.child('Non-Recyclable').child(nonrecy_items[i]).set("0");
        }
        for (var i = 0; i < recy_items.length; i++) {
          usersRef.child('Recyclable').child(recy_items[i]).set("0");
        }
        usersRef.child('Schedule').set("2");
        usersRef.child('Score').set("0");
      }
      print("before");
      getInfo();
      print("after");
    });
  }

  String getName() {
    return name;
  }

  String getHeader() {
    return header;
  }

  String getEmail() {
    return userEmail;
  }

  int getScore() {
    return score;
  }

  int getTotal() {
    int total = 0;
    for (var i = 0; i < recy_num.length; i++) {
      total = total + int.parse(recy_num[i]);
    }
    for (var i = 0; i < nonrecy_num.length; i++) {
      total = total + int.parse(nonrecy_num[i]);
    }
    return total;
  }

  List<dynamic> getAll() {
    var all = [];
    for (var i = 0; i < recy_num.length; i++) {
      var temp = [recy_items[i], int.parse(recy_num[i])];
      all.add(temp);
    }
    for (var i = 0; i < nonrecy_num.length; i++) {
      var temp = [nonrecy_items[i], int.parse(nonrecy_num[i])];
      all.add(temp);
    }
    return all;
  }

  List<String> nonrecyList() {
    return nonrecy_items;
  }

  List<String> recyList() {
    return recy_items;
  }

  List<String> recyPoints() {
    getInfo();
    return recy_num;
  }

  List<String> nonrecyPoints() {
    getInfo();
    return nonrecy_num;
  }

  void signout() {
    _auth.signOut();
  }
}

final Authservice authservice = Authservice();
