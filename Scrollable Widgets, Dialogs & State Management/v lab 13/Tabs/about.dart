import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('About Page')),
      ),
      body: Center(child: Text('This is About Page.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),),
    );
  }
}
