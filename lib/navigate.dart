import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:recyclops/screens/reward.dart';
import 'package:recyclops/screens/userinfo.dart';

class Navigate extends StatefulWidget {
  @override
  _NavigateState createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int pageIndex = 0;

  pageDecider(int page) {
    if (page == 0) {
      print("First page");
      return RewardScreen();
    } else if (page == 1) {
      print("Second page");
      return HomePage();
    } else if (page == 2) {
      print("Third page");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: pageDecider(pageIndex),
      ),
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
            iconData: Icons.attach_money_outlined,
            label: 'Reward',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.person_outline_outlined,
            label: 'Home',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.calendar_today_outlined,
            label: 'Calender',
            selectedBackgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
