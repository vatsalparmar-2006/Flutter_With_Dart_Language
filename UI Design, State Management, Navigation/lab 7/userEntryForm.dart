import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserentryformPage extends StatefulWidget {
  UserentryformPage({super.key});

  @override
  State<UserentryformPage> createState() => _UserentryformPageState();
}

class _UserentryformPageState extends State<UserentryformPage> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isRegistration = false;
  dynamic loginText = 'Login';
  dynamic registrationText = 'Register';
  bool isSee = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Registration Form for Flutter",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formkey,
            child: Column(
          children: [
            Image.asset(
              'assets/images/flutterjpeg.jpeg',
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 10,
            ),
            getTextFormFeildWidget(nameController, 'Enter your name', validator: (value){
              if(value!.isEmpty){
                return 'Enter your name';
              }
              return null;
            }),
            SizedBox(
              height: 20,
            ),
            getTextFormFeildWidget(emailController, 'Enter your email', validator: (value) {
              if (value!.isEmpty) {
                return 'Enter your email address';
              }
              if(! RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return 'Enter Valid email';
              }
              return null;
            },
            isRequired: true,
              suffixIcon: Icons.email_rounded,
            ),

            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: isSee, // Toggle text visibility
              decoration: InputDecoration(
                labelText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isSee ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      isSee = !isSee;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter Password';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Visibility(
              visible: isRegistration,
              child: TextFormField(
                controller: confirmPasswordController,
                obscureText: isSee, // Toggle text visibility
                decoration: InputDecoration(
                  labelText: 'Enter your password for confirmation',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isSee ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isSee = !isSee;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Password';
                  }
                  if (value!=passwordController.text) {
                    return 'Enter valid confirmation password';
                  }
                  return null;
                },
              ),

            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                if(_formkey.currentState!.validate()){
                  Text('Successfully Registration.');                }
              });
            }, child: Text(isRegistration ?"regisration":"login", style: TextStyle(fontSize: 20),)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Are you registered?'),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: (){

                    setState(() {
                      isRegistration = !isRegistration;
                      //   loginText = isRegistration ? registrationText : loginText;
                      // registrationText = isRegistration ? loginText : registrationText;
                    });
                    },
                  child: Text(isRegistration ?"login":"regisration", style: TextStyle(color: CupertinoColors.activeBlue, fontSize: 20),),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}

Widget getTextFormFeildWidget(TextEditingController textFeildController,String lableStyleText, {String? Function(String?)? validator,bool isRequired=false,IconData? suffixIcon}){
  return TextFormField(
    validator: validator,
    controller: textFeildController,
    decoration: InputDecoration(
        labelText: lableStyleText,
        labelStyle: TextStyle(fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      suffixIcon: isRequired && suffixIcon != null ? Icon(suffixIcon) : null,
      // suffixStyle: TextStyle(fontSize: 50),
    ),
  );
}