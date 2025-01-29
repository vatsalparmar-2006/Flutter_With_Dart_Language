import 'package:flutter_demo/utils/constant_file.dart';

import '../utils/constant_file.dart';

class Student {
  List<Map<String, dynamic>> studentList = [];

  List<Map<String, dynamic>> filteredList = [];

  // Add student
  void addStudent({required String name, required phone}) {
    Map<String, dynamic> map = {};
    map[ID] = studentList.length;
    map[NAME] = name;
    map[PHONE] = phone;
    studentList.add(map);
    print('User  with NAME $name added successfully.\n');
  }

  // Edit student
  void editStudent(
      {required int id, required String newName, required newPhone}) {
    for (dynamic u in studentList) {
      if (u[ID] == id) {
        u[NAME] = newName;
        u[PHONE] = newPhone;
        print('User  with ID $id updated successfully.\n');
        return;
      }
    }
  }

  // Delete student
  void deleteStudent({required int id}) {
    studentList.removeAt(id);
  }

  // Display students
  List<Map<String, dynamic>> displayStudents() {
    return studentList;
  }

  // Search students
  List<Map<String, dynamic>> searchStudents(String searchData) {
    return studentList.where((student) {
      return student[NAME]
              .toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase()) ||
          student[PHONE]
              .toString()
              .toLowerCase()
              .contains(searchData.toString().toLowerCase());
    }).toList();
  }
}
