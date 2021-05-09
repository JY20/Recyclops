import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:recyclops/auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../auth.dart';
import '../notification.dart';

class RewardScreen extends StatefulWidget {
  final VoidCallback voidCallback;

  RewardScreen({this.voidCallback});

  @override
  _RewardScreenState createState() =>
      _RewardScreenState(voidCallback: this.voidCallback);
}

class _RewardScreenState extends State<RewardScreen> {
  final VoidCallback voidCallback;

  _RewardScreenState({this.voidCallback});

  @override
  void initState() {
    // _getThingsOnStartup().then((value) => print("Async Done"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // User Info
        userPoints(),
        SizedBox(
          height: 20.0,
        ),

        // Visa Card List
        Text(
          "Visa Cards",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20.0,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        SizedBox(
          height: 170.0,
          child: listView(170, 150, 80, context, this.voidCallback, "Visa",
              "assets/visa.png"),
        ),
        SizedBox(
          height: 20.0,
        ),

        // Amazon Gift Card list
        Text(
          "Amazon Gift Cards",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20.0,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        SizedBox(
          height: 170.0,
          child: listView(170, 300, 220, context, this.voidCallback, "Amazon",
              "assets/amazon.png"),
        ),
        SizedBox(
          height: 20.0,
        ),

        // Ebay Gift Card list
        Text(
          "Ebay Gift Cards",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20.0,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        SizedBox(
          height: 170.0,
          child: listView(170, 300, 220, context, this.voidCallback, "Ebay",
              "assets/ebay.png"),
        ),
        SizedBox(
          height: 20.0,
        ),

        // Itunes Gift Card list
        Text(
          "Itunes Gift Cards",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20.0,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        SizedBox(
          height: 170.0,
          child: listView(170, 300, 220, context, this.voidCallback, "Itunes",
              "assets/itunes.png"),
        ),
        SizedBox(
          height: 20.0,
        ),

        // Amazon Gift Card list
        Text(
          "Starbucks Gift Cards",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20.0,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        SizedBox(
          height: 170.0,
          child: listView(170, 300, 220, context, this.voidCallback, "Sarbucks",
              "assets/starbucks.png"),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

Widget listView(
    double height,
    double width,
    double offset,
    BuildContext _context,
    VoidCallback callback,
    String Name,
    String imageLink) {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      giftCard(Name, "\$50", imageLink, height, width, "3500", offset, _context,
          callback),
      SizedBox(width: 30.0),
      giftCard(Name, "\$40", imageLink, height, width, "3500", offset, _context,
          callback),
      SizedBox(width: 30.0),
      giftCard(Name, "\$30", imageLink, height, width, "3500", offset, _context,
          callback),
      SizedBox(width: 30.0),
      giftCard(Name, "\$20", imageLink, height, width, "3500", offset, _context,
          callback),
      SizedBox(width: 30.0),
      giftCard(Name, "\$10", imageLink, height, width, "3500", offset, _context,
          callback),
    ],
  );
}

Widget giftCard(
    String name,
    String amount,
    String imageLink,
    double height,
    double width,
    String points,
    double offset,
    BuildContext _context,
    VoidCallback callback) {
  return Center(
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 16.0,
            spreadRadius: 1,
            color: Colors.white.withOpacity(0.1),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20.0,
            sigmaY: 20.0,
          ),
          // Main thing
          child: GestureDetector(
            onTap: () {
              emailNot.apiRequest(authservice.getEmail());
              print("Container clicked");
              return AddViewPopup(callback).popup(_context);
            },
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white.withOpacity(0.1),
                  )),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: offset,
                          ),
                          Text(
                            amount,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image(
                        image: AssetImage(imageLink),
                        height: 45.0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class AddViewPopup {
  String name;
  int numberOfPills, pillPerDay;
  VoidCallback voidCallback;

  AddViewPopup(this.voidCallback);

  popup(context) {
    return AwesomeDialog(
      context: context,
      title: "Add Pill",
      headerAnimationLoop: false,
      dialogType: DialogType.INFO,
      animType: AnimType.SCALE,
      body: Padding(
          padding: EdgeInsets.all(2),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Email sent",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1), fontSize: 30),
                  )),
              Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "An email has been sent to you account with the special discount code.",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1), fontSize: 20),
                  )),
              Padding(
                padding: EdgeInsets.all(2),
                child: ElevatedButton(onPressed: () {}, child: Text("Ok")),
              )
            ],
          )),
    )..show();
  }
}

Widget userPoints() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      children: [
        Text(
          '${authservice.getScore()} Points Earned',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 30.0,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        Text(
          "\$0 Earned",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 30.0,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ],
    ),
  );
}
