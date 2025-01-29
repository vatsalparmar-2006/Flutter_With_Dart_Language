import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/CrudOperation/addStudentForm.dart';
import 'package:flutter_demo/CrudOperation/studentClass.dart';
import 'package:flutter_demo/UI%20Static%20Crud/CrudOperation/studentClass.dart';
import 'package:flutter_demo/utils/constant_file.dart';

import '../utils/constant_file.dart';
import 'addStudentForm.dart';

class Displaypage extends StatefulWidget {
  Displaypage({super.key});

  @override
  State<Displaypage> createState() => _DisplaypageState();
}

class _DisplaypageState extends State<Displaypage> {

  Student _student = Student();
  bool isGrid = false;
  bool isShow = false;
  String searchQuery = '';
  List<Map<String, dynamic>> filteredList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredList =   _student.studentList;
    // searchController.addListener(filteredList);
  }

  void updateSearch(String query){
    query = searchController.text.toLowerCase();
    setState(() {
      searchQuery = query;
      filteredList = _student.searchStudents(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Student Management',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.purple,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                },
                icon: isGrid ? Icon(Icons.list) : Icon(Icons.grid_4x4_outlined)) ,
            IconButton(
                onPressed: () async {
                  final result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Addstudentform();
                  }));
                  setState(() {
                    if (result != null) {
                      _student.addStudent(name: result[NAME], phone: result[PHONE]);

                    }
                  });

                },
                icon: Icon(Icons.add_sharp)),
            IconButton(onPressed: (){
              setState(() {
                isShow = !isShow;
              });
            }, icon: Icon(Icons.search))
          ],
        ),
        body: _student.studentList.isEmpty || filteredList.isEmpty
            ? Center(child: Text('No Student found'))
            : isGrid
                ? Column(
                  children: [
                    isShow==true ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value){
                          updateSearch(value);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          labelText: 'Search',
                        ),
                      ),
                    ) : Container(),
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                          itemBuilder: (context, index) => getStudentCard(index),
                          itemCount: filteredList.length,
                        ),
                    ),
                  ],
                )
                : Column(
                  children: [
                    isShow==true ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value){
                          updateSearch(value);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          labelText: 'Search',
                        ),
                      ),
                    ) : Container(),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => getStudentCard(index),
                        itemCount: filteredList.length,
                      ),
                    ),
                  ],
                ));
  }

  Widget getStudentCard(int index) {
    final stu = filteredList[index];
    // print('----------${filteredList}---------');
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          elevation: 10,
          child: ListTile(
            title: Text(stu[NAME]),
            subtitle: Text(stu[PHONE]),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text('Delete'),
                                content: Text('Are you sure want to delete??'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        _student.deleteStudent(id: index);
                                        updateSearch(searchQuery);
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Text('Yes')),
                                  TextButton(onPressed: () {}, child: Text('No'))
                                ],
                              );
                            });
                      },
                      icon: Icon(Icons.delete)),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () async {
                        var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Addstudentform(
                                      userDetail: stu,
                                    )),
                        );
                        if(result != null){
                          _student.editStudent(id: index, newName: result[NAME], newPhone: result[PHONE]);
                          updateSearch(searchQuery);
                              setState(() {

                          });
                        }
                      },
                      icon: Icon(Icons.edit)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
