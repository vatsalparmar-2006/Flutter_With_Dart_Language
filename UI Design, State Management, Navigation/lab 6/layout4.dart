import 'package:flutter/material.dart';

class Layout4 extends StatelessWidget {
  const Layout4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Layout 4")),
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
                    color: Colors.brown,
                  )),
              Expanded(
                  child: Container(
                    color: Color(0xFF3AD7C0),
                  ))
            ],
          )),
          Expanded(
              flex: 2,
              child: Row(
            children: [
              Expanded(child: Container(
                color: Colors.yellow,
              )),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Color(0xFf3AD7C0),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                    Expanded(child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.purple,
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
              ),
              Expanded(child: Container(
                color: Colors.blueGrey,
              ))
            ],
          )),
          Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(child: Container(
                    color: Colors.black,
                  )),
                  Expanded(child: Container(
                    color: Colors.white,
                  )),
                  Expanded(child: Container(
                    color: Colors.black,
                  )),
                  Expanded(child: Container(
                    color: Colors.white,
                  ))
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Color(0xFf3AD7C0),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.purpleAccent,
                                        ),
                                      ),
                                    ],
                                  )),
                                  Expanded(child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: Colors.green,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ],
                        )),
                        Expanded(child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.purple,
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
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.yellowAccent,
                  )),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Color(0xFf3AD7C0),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Expanded(child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.purpleAccent,
                                        ),
                                      ),
                                    ],
                                  )),
                                  Expanded(child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          color: Colors.green,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ],
                        )),
                        Expanded(child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.purple,
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
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
