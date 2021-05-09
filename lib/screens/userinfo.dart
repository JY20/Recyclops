import 'package:flutter/material.dart';
import '../auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> entries = <String>['A', 'B', 'C'];

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
                height: 50,
                color: Colors.amber,
                child: Center(child: Text('Entry ${entries[index]}')),
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
          '${authservice.getName()}',
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
        // Image(
        //   image: AssetImage("assets/medal.png"),
        //   height: 100.0,
        // ),
        SizedBox(
          width: 5.0,
        ),
        Column(
          children: [
            Text(
              'You currently have:',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 30.0,
                color: Colors.black.withOpacity(1),
              ),
            ),
            Text(
              '${authservice.getScore()} Points Earned',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 30.0,
                color: Colors.black.withOpacity(1),
              ),
            ),
            Text(
              '   Recycled ${authservice.getTotal()} Items',
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

void createListWidgets() {
  for (var i = 0; i < 15; i++) {}
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
