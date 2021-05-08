import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

class Navigate extends StatefulWidget {
  @override
  _NavigateState createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int pageIndex = 0;

  pageDecider(int page) {
    if (page == 0) {
    } else if (page == 1) {
    } else if (page == 2) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageDecider(pageIndex),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.grey[850],
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.white,
          showSelectedItemShadow: false,
          barHeight: 70,
        ),
        selectedIndex: pageIndex,
        onSelectTab: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.person_outline_outlined,
            label: 'Home',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.medical_services_outlined,
            label: 'Schedule',
            selectedBackgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
