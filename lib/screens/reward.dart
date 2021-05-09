import 'dart:ui';
import 'package:flutter/material.dart';

import '../auth.dart';
import '../notification.dart';

class RewardScreen extends StatefulWidget {
  @override
  _RewardScreenState createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
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
          child: listView(170, 150, 80),
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
          child: listView(170, 300, 220),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

Widget listView(double height, double width, double offset) {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      giftCard("Amazon", "\$20", "", height, width, "3500", offset),
      SizedBox(width: 30.0),
      giftCard("Amazon", "\$20", "", height, width, "3500", offset),
      SizedBox(width: 30.0),
      giftCard("Amazon", "\$20", "", height, width, "3500", offset),
      SizedBox(width: 30.0),
      giftCard("Amazon", "\$20", "", height, width, "3500", offset),
      SizedBox(width: 30.0),
      giftCard("Amazon", "\$20", "", height, width, "3500", offset),
    ],
  );
}

Widget giftCard(String name, String amount, String imageLink, double height,
    double width, String points, double offset) {
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
                        image: AssetImage("assets/google_logo.png"),
                        height: 35.0,
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
          "\$20 Earned",
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
