import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class BirthDayCard extends StatefulWidget {
  const BirthDayCard({super.key});

  @override
  State<BirthDayCard> createState() => _BirthDayCardState();
}

class _BirthDayCardState extends State<BirthDayCard> {

  bool isFlag = true;
  TextEditingController nameController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Birthday Card',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: isFlag
            ? Form(
                key: _formkey,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.lightBlueAccent,
                      Colors.cyanAccent,
                      Colors.blueAccent
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 200, left: 20, right: 20),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (_formkey.currentState!.validate()) {
                                  isFlag = false;
                                }
                              });
                            },
                            child: Text(
                              'Click here.',
                              style: TextStyle(fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                ))
            : Form(
                child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.lightBlueAccent,
                        Colors.cyanAccent,
                        Colors.blueAccent
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
                  ),
                  Expanded(
                    child: Center(
                      child: SlideInLeft(
                        from: 300,
                        child: Container(
                            height: 500,
                            width: 500,
                            child: Image.asset(
                              'assets/images/birthdaycard.jpg',
                              fit: BoxFit.contain,
                            )),
                      ),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.center,
                  //   // margin: EdgeInsets.only(top: 390, left: 200),
                  //   child: Text(
                  //     nameController.text,
                  //     style: TextStyle(fontSize: 30, color: Colors.red),
                  //   ),
                  // ),
                  Positioned(
                    top: size.height*0.49,
                    left: size.width*0.55,
                    child: Text(
                      nameController.text,
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  )
                ],
              )));
  }
}
