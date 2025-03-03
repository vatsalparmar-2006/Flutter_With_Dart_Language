import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? data = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: Text("About Page")),
      body: Center(
        child: Text("Welcome to About!\nData: $data", textAlign: TextAlign.center),
      ),
    );
  }
}