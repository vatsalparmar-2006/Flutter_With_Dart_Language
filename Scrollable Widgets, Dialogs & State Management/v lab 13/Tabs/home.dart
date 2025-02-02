import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home Page')),
      ),
      body: Center(child: Text('This is home Page.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),),
    );
  }
}
