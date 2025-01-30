import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewGrid extends StatefulWidget {
  ListViewGrid({super.key});

  @override
  State<ListViewGrid> createState() => _ListViewGridState();
}

class _ListViewGridState extends State<ListViewGrid> {
  bool isGrid = false;
  List<String> names = ['Rohit', 'Rahul', 'Kohli', 'SKY', 'Pant', 'Hardik', 'Jaddu', 'Axar', 'Bhuvi', 'Shami', 'Chahal'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isGrid ? 'Grid View' : 'List View',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isGrid = !isGrid;
                });
              },
              icon: isGrid ? Icon(Icons.list) : Icon(Icons.grid_4x4_outlined)),
        ],
      ),
      body: isGrid ? GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3),
        itemBuilder: (context, index) => getCard(index),
        itemCount: names.length,
      ) : ListView.builder(
        itemBuilder: (context, index) => getCard(index),
        itemCount: names.length,
      ),
    );
  }

  Widget getCard(int index) {
    final name = names[index];
    return Container(
      height: 150,
      child: Card(
        elevation: 8,
        child: ListTile(
          title: Center(child: Text(name)),
        ),
      ),
    );
  }
}
