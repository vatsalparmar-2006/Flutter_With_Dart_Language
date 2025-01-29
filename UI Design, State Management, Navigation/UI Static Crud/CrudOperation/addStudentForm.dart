import 'package:flutter/material.dart';

import '../utils/constant_file.dart';

class Addstudentform extends StatefulWidget {
  Map<String, dynamic>? userDetail;
  Addstudentform({super.key, this.userDetail});

  @override
  State<Addstudentform> createState() => _AddstudentformState();
}

class _AddstudentformState extends State<Addstudentform> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.userDetail != null) {
      nameController.text = widget.userDetail?[NAME] ?? '';
      phoneController.text = widget.userDetail?[PHONE] ?? '';
      print(widget.userDetail);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(widget.userDetail == null ? 'Add User' : 'Edit User'))),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(key: _formKey,
            child: Column(
          children: [
            getTextField(nameController, 'Name'),
            SizedBox(height: 20),
            getTextField(phoneController, 'Phone',),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                Map<String, dynamic> map = {};
                map[NAME] = nameController.text.toString();
                map[PHONE] = phoneController.text.toString();
                // print('Added');
                print(map);
                Navigator.pop(context, map);
              }
            }, child: Text(widget.userDetail == null ? 'Add' : 'Edit'))
          ],
        )),
      ),
    );
  }
}

Widget getTextField(TextEditingController controller, String lableText,){
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: lableText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    validator: (value){
      if (value == null || value.isEmpty) return 'Please enter $lableText';
      return null;
    },
  );
}
