import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final String username;
  const FirstPage({required this.username});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        backgroundColor: Colors.yellow,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            RichText(text: TextSpan(
              text: "Welcome ",
              children: [
                TextSpan(text: username  , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                TextSpan(text: " in the first page")
              ]
            )),

            // Text('Welcome, $username in the first page.', style: TextStyle(fontSize: 25),),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
              Navigator.pop(context);
            }, child: Text('Home Page'))
          ],
        ),
      ),
    );
  }
}
