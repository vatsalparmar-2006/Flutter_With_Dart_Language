import 'package:flutter/material.dart';

class TextFeildDemo extends StatelessWidget {
  TextFeildDemo({super.key});

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    bool isSee = true;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "TextFeild Widget Demo",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.blueAccent,
      ),
      body: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomTextFontWidget(title: 'Like Something Form...', fontSize: 30),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 15
                      ),
                      labelText: 'Enter your name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  controller: nameController,
                ), //Name
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your phone number';
                    }
                    if (value.length != 10) {
                      return 'Enter valid phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter your phone number',
                      labelText: 'Enter your phone number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  controller: phoneController,
                ), //Phone
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                          fontSize: 15,
                      ),
                      labelText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(Icons.remove_red_eye_rounded)),
                  controller: passwordController,
                ), //Password
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        print(nameController.text);
                        print(phoneController.text);
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          )),
    );
  }
}

Widget CustomTextFontWidget({required title, required fontSize}){
  return Text(title, style: TextStyle(fontSize: fontSize, color: Colors.blueGrey),);
}