import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_demo/NavigatorDemo/home.dart';
import 'package:flutter_demo/lab 9/tabView.dart';

class SplacescreenDemo extends StatefulWidget {
  const SplacescreenDemo({super.key});

  @override
  State<SplacescreenDemo> createState() => _SplacescreenDemoState();
}

class _SplacescreenDemoState extends State<SplacescreenDemo> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>TabviewDemo()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/flutterjpeg.jpeg'),
          )
        ),
      )
    );
  }
}
