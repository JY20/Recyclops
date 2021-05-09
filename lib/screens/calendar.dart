import 'dart:ui';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Caldendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return calendar();
  }
}

Widget calendar() {
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
          child: Container(
            height: 440,
            width: 500,
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
                child: Container(
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
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
