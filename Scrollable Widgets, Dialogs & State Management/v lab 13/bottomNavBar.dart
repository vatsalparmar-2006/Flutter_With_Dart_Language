import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/v%20lab%2013/Tabs/home.dart';

import 'Tabs/about.dart';
import 'Tabs/contact.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int select = 0;
  List<Widget> tabs = [Home(), Contact(), About()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bottom Navigation',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: tabs[select],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Contact"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "About")
        ],
        onTap: (value) {
          setState(() {
            select = value;
          });
        },
      ),
    );
  }
}
