import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

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
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        SizedBox(
          height: 170.0,
          child: listView(170, 150),
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
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        SizedBox(
          height: 150.0,
          child: listView(150, 300),
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
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        SizedBox(
          height: 150.0,
          child: listView(150, 300),
        ),
        SizedBox(
          height: 20.0,
        ),

        // Play Store Gift Card list
        Text(
          "Play Store Gift Cards",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 20.0,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        SizedBox(
          height: 150.0,
          child: listView(150, 300),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

Widget listView(double height, double width) {
  return ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      giftCard("Amazon", "\$20", "", height, width, "3500"),
      SizedBox(width: 30.0),
      giftCard("Amazon", "\$20", "", height, width, "3500"),
      SizedBox(width: 30.0),
      giftCard("Amazon", "\$20", "", height, width, "3500"),
      SizedBox(width: 30.0),
      giftCard("Amazon", "\$20", "", height, width, "3500"),
      SizedBox(width: 30.0),
      giftCard("Amazon", "\$20", "", height, width, "3500"),
    ],
  );
}

Widget giftCard(String name, String amount, String imageLink, double height,
    double width, String points) {
  return Center(
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 16.0,
          spreadRadius: 0,
          color: Colors.black.withOpacity(0.2),
        )
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20.0,
            sigmaY: 20.0,
          ),
          // Main thing
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
              child: Column(
                children: [
                  Text(
                    amount,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.6)),
                  ),
                  Image(
                    image: AssetImage("assets/google_logo.png"),
                    height: 35.0,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.6)),
                  ),
                ],
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
    child: Row(
      children: [
        Image(
          image: AssetImage("assets/medal.png"),
          height: 100.0,
        ),
        SizedBox(
          width: 5.0,
        ),
        Column(
          children: [
            Text(
              '1050 Points Earned',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 30.0,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            Text(
              "\$20 Earned",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 30.0,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
