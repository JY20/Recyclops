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

  Future<User> signIn12() async {
    print(await _googleSignIn.isSignedIn().toString());
    GoogleSignInAccount guser = await _googleSignIn.signIn();
    GoogleSignInAuthentication gauth = await guser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gauth.accessToken,
      idToken: gauth.idToken,
    );
    UserCredential authResult = await _auth.signInWithCredential(credential);
    User user = authResult.user;
    //print("sign in with" + user.displayName);
    //loading.add(false);
    //DatabaseReference usersRef = ref.child(user.displayName);
    // usersRef.once().then((DataSnapshot snapshot) {
    //   Map<dynamic, dynamic> values = snapshot.value;
    //   values.forEach((key, values) {
    //     String temp = values["schedule"].toString();
    //     var array = temp.split(",");
    //     List<int> schedules = [];
    //     for (var i = 0; i < array.length; i++) {
    //       schedules.add(int.parse(array[i]));
    //     }
    //     listOfPills.add(Pill(
    //         name: values["name"].toString(),
    //         pillsLeft: int.parse(values["number of pills"].toString()),
    //         schedule: schedules));
    //   });
    // });
    //name = user.displayName;
    return user;
  }

  String getName() {
    return name;
  }

  void signout() {
    _auth.signOut();
  }
}

final Authservice authservice = Authservice();
