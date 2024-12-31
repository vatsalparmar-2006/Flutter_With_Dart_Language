import 'package:flutter/material.dart';

class Layout3 extends StatelessWidget {
  const Layout3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Layout 3")),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.yellowAccent,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white70,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.purple,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        // mainAxisAlignment: ,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.brown,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.pinkAccent,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow,
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
                  color: Colors.lightGreenAccent,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
