import 'dart:ui';

import 'package:flutter/material.dart';
import '../auth.dart';
import 'package:recyclops/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<dynamic> entries = authservice.getAll();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // User name
        userName(),
        // Space
        SizedBox(
          height: 30.0,
        ),
        // User info
        userPoints(),
        // Space
        SizedBox(
          height: 30.0,
        ),
        // Items recycled
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 80,
                child: giftCard("${entries[index][0]}", "${entries[index][1]}",
                    "", index.toString()),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ],
    );
  }
}

Widget giftCard(String name, String amount, String imageLink, String index) {
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
        borderRadius: BorderRadius.circular(60.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20.0,
            sigmaY: 20.0,
          ),
          // Main thing
          child: Container(
            height: 80,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(60.0),
                border: Border.all(
                  width: 1.5,
                  color: Colors.white.withOpacity(0.1),
                )),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${index} )",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.7)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.7)),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          amount,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget userName() {
  return Container(
    child: Column(
      children: [
        SizedBox(
          height: 50.0,
        ),
        Text(
          'Welcome Back,',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 45.0,
            color: Colors.black.withOpacity(1),
          ),
        ),
        Text(
          '${authservice.getName()}        ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 45.0,
            color: Colors.black.withOpacity(1),
          ),
        ),
      ],
    ),
  );
}

Widget userPoints() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Row(
      children: [
        Column(
          children: [
            Text(
              '${authservice.getScore()} Points              ',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 30.0,
                color: Colors.black.withOpacity(1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Recycled ${authservice.getTotal()} Items  ',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 30.0,
                color: Colors.black.withOpacity(1),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget recycledItemsList(String text, String imageLink) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      side: BorderSide(width: 0.9, color: Colors.grey[850]),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      backgroundColor: Colors.white,
    ),
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image(
            image: AssetImage(imageLink),
            height: 35.0,
          ),
          Padding(padding: const EdgeInsets.only(left: 10)),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black.withOpacity(1),
            ),
          ),
        ],
      ),
    ),
  );
}
