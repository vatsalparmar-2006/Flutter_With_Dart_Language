import 'package:flutter/material.dart';

class Layout1 extends StatelessWidget {
  const Layout1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Layout 1")),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.green,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          )),

          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.brown,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blueAccent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.purpleAccent,
                    ),
                  ),
                ],
              )),

          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black87,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Color(0xFF522211),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
