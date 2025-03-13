import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://66f7b785b5d85f31a3436025.mockapi.io/Students";

  Future<List<Map<String, dynamic>>> getUsers() async {
    var res = await http.get(Uri.parse(baseUrl));
    return List<Map<String, dynamic>>.from(json.decode(res.body));
  }

  Future<void> createUser(String name, String email) async {
    await http.post(Uri.parse(baseUrl),
        body: jsonEncode({'name': name, 'email': email}),
        headers: {'Content-Type': 'application/json'});
  }

  Future<void> updateUser(String id, String name, String email) async {
    await http.put(Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'email': email}));
  }

  Future<void> deleteUser(String id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}

class TryApiCrud extends StatefulWidget {
  const TryApiCrud({super.key});

  @override
  State<TryApiCrud> createState() => _TryApiCrudState();
}

class _TryApiCrudState extends State<TryApiCrud> {
  final ApiService apiService = ApiService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List<Map<String, dynamic>> users = [];

  Future<void> _refresh() async {
    users = await apiService.getUsers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD'),
      ),
      body: users.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text(user['name']),
              subtitle: Text(user['email']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        _showUserForm(
                            id: user['id'],
                            name: user['name'],
                            email: user['email']);
                      },
                      icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () async {
                        await apiService.deleteUser(user['id']);
                        _refresh();
                      },
                      icon: const Icon(Icons.delete)),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showUserForm(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showUserForm({String? id, String? name, String? email}) async {
    TextEditingController nameController =
    TextEditingController(text: name ?? '');
    TextEditingController emailController =
    TextEditingController(text: email ?? '');

    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(id == null ? "Add User" : "Edit User"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Enter Name'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Enter Email'),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () async {
                    if (id == null) {
                      await apiService.createUser(
                          nameController.text, emailController.text);
                    } else {
                      await apiService.updateUser(
                          id, nameController.text, emailController.text);
                    }

                    Navigator.pop(context);
                    _refresh();
                  },
                  child: Text(id == null ? 'Add' : 'Edit'))
            ],
          );
        });
  }
}
