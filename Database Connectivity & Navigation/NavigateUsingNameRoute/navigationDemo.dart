import 'package:flutter/material.dart';

class NavigationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Navigate Using Named Route",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/home', arguments: 'Hello from NavigationDemo');
              },
              child: Text("Home"),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/contact', arguments: 'Contact Page Data');
              },
              child: Text("Contact"),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/about', arguments: 'About Page Info');
              },
              child: Text("About"),
            ),
          ],
        ),
      ),
    );
  }
}
