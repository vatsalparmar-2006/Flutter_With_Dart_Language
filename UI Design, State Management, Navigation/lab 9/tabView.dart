import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabviewDemo extends StatelessWidget {
  const TabviewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Tab View Demo')),
            backgroundColor: Colors.blueAccent,
            bottom: TabBar(tabs: [
              Text('Home Page', style: TextStyle(fontSize: 20),),
              Text('Contact Us', style: TextStyle(fontSize: 20),),
              Text('About Us', style: TextStyle(fontSize: 20),),
            ]),
          ),
          body: TabBarView(children: [
            SlideInLeft(from: 600,child: Center(child: Text('Welcome to the Home Page.', style: TextStyle(fontSize: 20),))),
            Center(child: ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Text('Contact'),
                  content: Text('contact about products.'),
                  actions: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back))
                  ],
                );
              });
            }, child: Text('Click here!'))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  showCupertinoDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('About'),
                      content: Text('about products.'),
                      actions: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_back))
                      ],
                    );
                  });
                }, child: Text('Click!')),
              ],
            )]),
        ));
  }
}
