import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Contact Page')),
      ),
      body: Center(child: Text('This is Contact Page.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),),
    );
  }
}
