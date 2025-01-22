import 'package:dart_demo/StaticCrud/constants.dart';

class Users {
  List<Map<String, dynamic>> users = [];

  // add(insert) user
  void addUser({required int id, required String name}) {
    for (dynamic i in users) {
      if (i[ID] == id) {
        print('Error : A user with this id($id) is already exists.\n');
        return;
      }
    }
    users.add({ID: id, NAME: name});
    print('User added successfully.\n');
  }

  // display user
  List<Map<String, dynamic>> displayUser(){
    if(users.isEmpty){
      print('No users available.\n');
    }
    return users;
  }

  // update user
  void updateUser({required int id, String? newname}){
    for(dynamic i in users){
      if(i[ID]==id){
        i[NAME] = newname;
        print('User  with ID $id updated successfully.\n');
        return;
      }
    }
    print("Error: User with ID $id not found.\n");
  }

  // delete(remove) user
  void deleteUser({required int id}){
    for(dynamic i in users){
      if(i[ID]==id){
        users.remove(i);
        print('User  with ID $id deleted successfully.\n');
        return;
      }
    }
    print("Error: User with ID $id not found.\n");
  }

  // search user
  void search({required searchData}){
    for(dynamic i in users){
      if(i[NAME].toString().toLowerCase().contains(searchData.toString().toLowerCase()) || i[ID].toString().toLowerCase().contains(searchData.toString().toLowerCase())){
        print('${i[NAME]} . ${i[ID]}');
      }
    }
  }
}
