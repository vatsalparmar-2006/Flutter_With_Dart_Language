import 'dart:collection';
import 'dart:io';

void main(){

  stdout.write('\nEnter length of list1 = ');
  int? n1 = int.parse(stdin.readLineSync()!);

  List<int> list1 = [];

  for(int i=0; i<n1; i++){
    stdout.write('Enter value for list[$i]: ');
    list1.add(int.parse(stdin.readLineSync()!));
  }

  stdout.write('\nEnter length of list2 = ');
  int? n2 = int.parse(stdin.readLineSync()!);

  List<int> list2 = [];

  for(int i=0; i<n2; i++) {
    stdout.write('Enter value for list[$i]: ');
    list2.add(int.parse(stdin.readLineSync()!));
  }

  List<int> commonElement = [];

  for(int i=0; i<n1; i++){
    for(int j=0; j<n2; j++){
      if(list1[i] == list2[j]){
        commonElement.add(list1[i]);
      }
    }
  }

  HashSet<int> result = HashSet();

  for(int i in commonElement){
    result.add(i);
  }
  print('\nCommon element between Both element : $result');
}