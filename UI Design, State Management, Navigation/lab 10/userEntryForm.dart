import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/constant_file.dart';

class UserentryformPage extends StatefulWidget {
  final Map<String, dynamic>? userDetail;

  UserentryformPage({super.key, this.userDetail});

  @override
  State<UserentryformPage> createState() => _UserentryformPageState();
}

class _UserentryformPageState extends State<UserentryformPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.userDetail != null) {
      nameController.text = widget.userDetail![NAME] ?? '';
      emailController.text = widget.userDetail![EMAIL] ?? '';
      passwordController.text = widget.userDetail!['password'] ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.userDetail == null ? 'Add User' : 'Edit User')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              getTextField(nameController, 'Name'),
              SizedBox(height: 15),
              getTextField(emailController, 'Email', isEmail: true),
              SizedBox(height: 15),
              getTextField(passwordController, 'Password', isPassword: true),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      NAME: nameController.text,
                      EMAIL: emailController.text,
                      'password': passwordController.text,
                    });
                  }
                },
                child: Text(widget.userDetail == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getTextField(TextEditingController controller, String label, {bool isEmail = false, bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter $label';
        if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Enter a valid email';
        return null;
      },
    );
  }
}
