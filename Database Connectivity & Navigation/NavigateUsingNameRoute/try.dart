import 'package:flutter/material.dart';
import 'navigationDemo.dart';
import 'home.dart';
import 'contact.dart';
import 'about.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => NavigationDemo(),
        '/home': (context) => HomeScreen(),
        '/contact': (context) => ContactScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
