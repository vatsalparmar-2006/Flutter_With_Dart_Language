import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? data = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: Text("Contact Page")),
      body: Center(
        child: Text("Welcome to Contact!\nData: $data", textAlign: TextAlign.center),
      ),
    );
  }
}