import 'package:flutter/material.dart';


import '../../v lab 11/listView.dart';
import 'firstPage.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FocusNode node = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/flutterjpeg.jpeg'),
                  ),
                ),
                Text('Drawer Demo', style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            )),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Cricketer's List"),
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListviewDemo()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: RawKeyboardListener(
          focusNode: node,
          onKey: (key){
            print(key.logicalKey );
            print(key.logicalKey.keyLabel == "Enter");
            if(key.logicalKey.keyLabel == "Enter"){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FirstPage(username: nameController.text)));
            }
          },
          child: Column(
            children: [
              Text('Welcome to the home page...', style: TextStyle(fontSize: 25),),
              SizedBox(height: 20,),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 15),
                    labelText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                controller: nameController,
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FirstPage(username: nameController.text)));
              }, child: Text('First Page'))
            ],
          ),
        ),
      ),
    );
  }
}
