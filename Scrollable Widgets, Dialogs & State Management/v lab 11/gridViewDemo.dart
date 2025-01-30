import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GiridViewDemo extends StatelessWidget {
  GiridViewDemo({super.key});

  var colorsArray = [
    Colors.blueAccent,
    Colors.brown,
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.yellowAccent,
    Colors.teal,
    Colors.grey
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child:
            Text('Grid View Demo', style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.deepOrange,
      ),

      body: GridView.count(crossAxisCount: 3,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: colorsArray[0],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: colorsArray[1],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: colorsArray[2],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: colorsArray[3],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: colorsArray[4],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: colorsArray[5],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: colorsArray[6],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(color: colorsArray[7],),
        ),
      ],
      ),
    );
  }
}
