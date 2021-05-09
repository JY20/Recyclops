import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Caldendar extends StatelessWidget {
  CalendarController _controller = CalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            TableCalendar(
              calendarController: _controller,
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.green, selectedColor: Colors.indigo),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
