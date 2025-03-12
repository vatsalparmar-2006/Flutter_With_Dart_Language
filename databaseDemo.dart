import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class Mydatabse extends StatefulWidget {
  const Mydatabse({super.key});

  @override
  State<Mydatabse> createState() => _MydatabseState();
}

class _MydatabseState extends State<Mydatabse> {
  late Database myDB;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  List<Map<String, dynamic>> data = [];

  Future<Database> initDatabase() async {
    return await openDatabase('myDB.db', version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE UserInfo(UserID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT)');
    });
  }

  Future<void> getDb() async {
    var db = await initDatabase();
    List<Map<String, dynamic>> myData = await db.query("UserInfo");
    setState(() {
      data = myData.map((row) {
        return {
          "UserID": row["UserID"] ?? 0,
          "name": row["name"] ?? "No Name",
          "email": row["email"] ?? "No Email",
        };
      }).toList();
    });
  }

  Future<bool> insertInDatabase(String name, String email) async {
    var db = await initDatabase();
    int rowsEffected = await db.insert('UserInfo', {'name': name, 'email': email});
    if (rowsEffected > 0) {
      getDb();
    }
    return rowsEffected > 0;
  }

  Future<bool> Updatedb(String name, String email, int userID) async {
    var db = await initDatabase();
    int rowsEffected = await db.update(
      'UserInfo',
      {"name": name, "email": email},
      where: 'UserID = ?',
      whereArgs: [userID],
    );
    if (rowsEffected > 0) {
      getDb();
    }
    return rowsEffected > 0;
  }

  Future<bool> deletedb(int userID) async {
    var db = await initDatabase();
    int rowsEffected = await db.delete(
      "UserInfo",
      where: 'UserID = ?', // Corrected column name
      whereArgs: [userID], // Prevent SQL injection
    );
    if (rowsEffected > 0) {
      getDb(); // Refresh UI
    }
    return rowsEffected > 0;
  }

  @override
  void initState() {
    super.initState();
    getDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Student Management System")),
      ),
      body: data.isNotEmpty
          ? ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]["name"] ?? "No Name"),
            subtitle: Text(data[index]["email"] ?? "No Email"),
            trailing: SizedBox(
              width: 50,
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        nameController.text = data[index]["name"];
                        emailController.text = data[index]["email"];

                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              padding: EdgeInsets.all(11),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Text("Edit Data",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 21),
                                  TextField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      hintText: "Enter name",
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(11)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(11)),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  TextField(
                                    maxLines: 1,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintText: "Enter email",
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(11)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(11)),
                                    ),
                                  ),
                                  SizedBox(height: 11),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () async {
                                            String name =
                                                nameController.text;
                                            String email =
                                                emailController.text;
                                            int userID =
                                            data[index]["UserID"];

                                            if (name.isNotEmpty &&
                                                email.isNotEmpty) {
                                              bool check =
                                              await Updatedb(
                                                  name, email, userID);
                                              if (check) {
                                                Navigator.pop(context);
                                              }
                                            }
                                          },
                                          child: Text("Update"),
                                        ),
                                      ),
                                      SizedBox(width: 11),
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () async {
                        int userID = data[index]["UserID"];
                        bool check = await deletedb(userID);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )
          : Center(child: Text('No data yet')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(11),
                width: double.infinity,
                child: Column(
                  children: [
                    Text("Add Data:",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(height: 21),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Enter name",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                      ),
                    ),
                    SizedBox(height: 11),
                    TextField(
                      maxLines: 1,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11)),
                      ),
                    ),
                    SizedBox(height: 11),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () async {
                              String name = nameController.text;
                              String email = emailController.text;
                              if (name.isNotEmpty && email.isNotEmpty) {
                                bool check = await insertInDatabase(name, email);
                                if (check) {
                                  Navigator.pop(context);
                                }
                                nameController.clear();
                                emailController.clear();
                              }
                            },
                            child: Text("Add Data"),
                          ),
                        ),
                        SizedBox(width: 11),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
