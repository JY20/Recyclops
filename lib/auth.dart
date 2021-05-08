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
  String name;
  String userEmail;
  String header;
  List<String> recy_items = ["tin can", "plastic bottle"];
  List<String> nonrecy_items = ["bottle cap", "straw"];
  List<String> recy_num = ['saassss', 's'];
  List<String> nonrecy_num = ['s', 's'];
  int score;
  int day;

  Future<User> signIn12() async {
    GoogleSignInAccount guser = await _googleSignIn.signIn();
    GoogleSignInAuthentication gauth = await guser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gauth.accessToken,
      idToken: gauth.idToken,
    );
    UserCredential authResult = await _auth.signInWithCredential(credential);
    User user = authResult.user;
    name = user.displayName;
    userEmail = user.email.toString();
    var array = userEmail.split("@");
    header = array[0].toString();
    newUser();
    print(score.toString() + day.toString());
    print(recy_num);
    print(nonrecy_num);
    return user;
  }

  Future<void> getInfo() {
    DatabaseReference usersRef = ref.child(header);
    usersRef.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, values) {
        if (key.toString() == 'Schedule') {
          day = int.parse(values.toString());
        }
        if (key.toString() == 'Score') {
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
      getInfo();
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
