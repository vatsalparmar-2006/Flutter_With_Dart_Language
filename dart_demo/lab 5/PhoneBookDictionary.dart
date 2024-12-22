import 'dart:io';

void main() {
  List<Map<String, dynamic>> phonebook = [
    {'Name': 'Vatsal', 'Mobile': 9824414924, 'Email': 'vatsal@gmail.com'},
    {'Name': 'ABC', 'Mobile': 1234567895, 'Email': 'abcd@gmail.com'}
  ];

  stdout.write('\nEnter name to search = ');
  String name = (stdin.readLineSync()!);

  // for(int i in phonebook){
  //   if(phonebook[i]['Name']==name) {
  //     print(phonebook[i]);
  //   }
  // }

  for (int i = 0; i < phonebook.length; i++) {
    if (phonebook[i]['Name'] == name) {
      print(phonebook[i]);
    }
    else {
      print('Invalid Name.');
      break;
    }
  }
}
