import 'package:flutter/material.dart';
import 'apiServices.dart';

class ApiCrud extends StatefulWidget {
  const ApiCrud({super.key});

  @override
  State<ApiCrud> createState() => _ApiCrudState();
}

class _ApiCrudState extends State<ApiCrud> {
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
