import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListviewDemo extends StatefulWidget {
  ListviewDemo({super.key});

  @override
  State<ListviewDemo> createState() => _ListviewDemoState();
}

class _ListviewDemoState extends State<ListviewDemo> {
  List<String> names = [
    'Rohit',
    'Rahul',
    'Virat Kohli',
    'SKY',
    'Pant',
    'Pandya',
    'Jaddu',
    'Shami',
    'Bumrah',
    'Siraj',
    'Chahal'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('List View Demo')),
        backgroundColor: Colors.blueAccent,
      ),

      body: ListView.builder(
        // scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 200,
                width: 300,
                child: Card(
                  elevation: 25,
                  shadowColor: Colors.red,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${(index+1).toString()}.",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          names[index],
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  color: index%2==0 ? Colors.yellowAccent : Colors.deepPurpleAccent,
                ),
              ),
            );
          }),
    );
  }
}
