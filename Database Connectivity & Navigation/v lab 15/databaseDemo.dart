import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase extends StatefulWidget {
  const MyDatabase({super.key});

  @override
  State<MyDatabase> createState() => _MyDatabaseState();
}

class _MyDatabaseState extends State<MyDatabase> {
  late Database myDB;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  int selectedSemester = 1;

  List<Map<String, dynamic>> data = [];

  Future<Database> initDatabase() async {
    return await openDatabase('myDB.db', version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE UserInfo(UserID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, semester INTEGER)');
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
          "semester": row["semester"] ?? 1,
        };
      }).toList();
    });
  }

  Future<bool> insertInDatabase(String name, String email, int semester) async {
    var db = await initDatabase();
    int rowsEffected = await db.insert('UserInfo', {
      'name': name,
      'email': email,
      'semester': semester,
    });
    if (rowsEffected > 0) {
      getDb();
    }
    return rowsEffected > 0;
  }

  Future<bool> updateDb(String name, String email, int semester, int userID) async {
    var db = await initDatabase();
    int rowsEffected = await db.update(
      'UserInfo',
      {"name": name, "email": email, "semester": semester},
      where: 'UserID = ?',
      whereArgs: [userID],
    );
    if (rowsEffected > 0) {
      getDb();
    }
    return rowsEffected > 0;
  }

  Future<bool> deleteDb(int userID) async {
    var db = await initDatabase();
    int rowsEffected = await db.delete("UserInfo", where: 'UserID = ?', whereArgs: [userID]);
    if (rowsEffected > 0) {
      getDb();
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
      appBar: AppBar(title: Center(child: Text("Student Management System"))),
      body: data.isNotEmpty
          ? ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]["name"] ?? "No Name"),
            subtitle: Text("Email: ${data[index]["email"]}, Semester: ${data[index]["semester"]}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    nameController.text = data[index]["name"];
                    emailController.text = data[index]["email"];
                    selectedSemester = data[index]["semester"];
                    showEditDialog(data[index]["UserID"]);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await deleteDb(data[index]["UserID"]);
                  },
                ),
              ],
            ),
          );
        },
      )
          : Center(child: Text('No data yet')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddDialog(),
        child: Icon(Icons.add),
      ),
    );
  }

  void showAddDialog() {
    nameController.clear();
    emailController.clear();
    selectedSemester = 1;
    showModalBottomSheet(
      context: context,
      builder: (context) => buildForm(isEditing: false),
    );
  }

  void showEditDialog(int userID) {
    showModalBottomSheet(
      context: context,
      builder: (context) => buildForm(isEditing: true, userID: userID),
    );
  }

  Widget buildForm({required bool isEditing, int userID = 0}) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(isEditing ? "Edit Data" : "Add Data", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextField(controller: nameController, decoration: InputDecoration(labelText: "Enter name")),
          TextField(controller: emailController, decoration: InputDecoration(labelText: "Enter email")),
          DropdownButton<int>(
            value: selectedSemester,
            items: List.generate(8, (index) => DropdownMenuItem(value: index + 1, child: Text("Semester ${index + 1}"))),
            onChanged: (value) {
              setState(() {
                selectedSemester = value ?? 1;
              });
            },
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isNotEmpty && emailController.text.isNotEmpty) {
                      if (isEditing) {
                        await updateDb(nameController.text, emailController.text, selectedSemester, userID);
                      } else {
                        await insertInDatabase(nameController.text, emailController.text, selectedSemester);
                      }
                      Navigator.pop(context);
                    }
                  },
                  child: Text(isEditing ? "Update" : "Add"),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
