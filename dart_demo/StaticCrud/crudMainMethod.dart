import 'dart:io';

import 'package:dart_demo/StaticCrud//crudMethods.dart';

void main() {
  Users user = Users();

  int choice = 0;

  do {
    stdout.write('Enter your choice : \n'
        '1 for insert(add) a user \n'
        '2 for update a user \n'
        '3 for delete(remove) a user \n'
        '4 for display users \n'
        '5 for search users \n'
        '6 for exit \n');

    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write("Enter ID:");
        int id = int.parse(stdin.readLineSync()!);
        stdout.write("Enter Name:");
        String name = stdin.readLineSync()!;
        user.addUser(id: id, name: name);
        break;

      case 2:
        stdout.write("Enter ID:");
        int id = int.parse(stdin.readLineSync()!);
        stdout.write("Enter a new name:");
        String newName = stdin.readLineSync()!;
        user.updateUser(id: id, newname: newName);
        break;

      case 3:
        stdout.write("Enter ID:");
        int id = int.parse(stdin.readLineSync()!);
        user.deleteUser(id: id);
        break;

      case 4:
        List<Map<String, dynamic>> userList = user.displayUser();
        // print("ID\tName");
        for (dynamic i in userList) {
          print('ID : ${i['id']} \t NAME : ${i['name']}');
        }
        print('');
        break;

      case 5:
        stdout.write("Enter SearchData:");
        dynamic data = stdin.readLineSync()!;
        user.search(searchData: data);
        print('');
        break;

      default:
        print('Invalid Choice!!!');
    }
  } while (choice != 6);
}
