import 'package:flutter/material.dart';

class Userinfo extends StatelessWidget {
  String username = "sss";
  int points = 100;
  List<String> listInfo = ["plastic: 9", "carboard: 10"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Text('Hi, ' + username,
              style: TextStyle(fontSize: 30, color: Colors.yellow[900])),
          SizedBox(height: 20),
          Text('Current Points: ' + points.toString(),
              style: TextStyle(fontSize: 30, color: Colors.yellow[900])),
          SizedBox(height: 20),
          ListView(
            children: [
              for (var i = 0; i < 10; i++)
                Text(listInfo[i],
                    style: TextStyle(fontSize: 30, color: Colors.yellow[900])),
            ],
          )
        ])));
  }
}
