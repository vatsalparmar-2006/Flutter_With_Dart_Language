import 'dart:collection';
import 'dart:io';

void main(){

  stdout.write('\nEnter the value of n = ');
  int? n = int.parse(stdin.readLineSync()!);

  List<int> list = [];

  for (int i = 0; i < n; i++) {
    stdout.write('Enter value for list[$i]: ');
    list.add(int.parse(stdin.readLineSync()!));
  }

  HashSet<int> nList = HashSet();

  for(int i in list){
    nList.add(i);
  }

  List<int> newList = [];

  for(int i in nList){
    newList.add(i);
  }

  print('\nAfter Removing Duplicate : $newList');
}