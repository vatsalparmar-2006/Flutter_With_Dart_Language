import 'dart:io';

void main() {

  stdout.write('\nEnter the value of number n = ');
  int? n = int.parse(stdin.readLineSync()!);

  List<int> nums = [];

  for(int i=0; i<n; i++){
    stdout.write('Enter value for list[$i]: ');
    nums.add(int.parse(stdin.readLineSync()!));
  }

  nums.sort();

  print('\nAfter Sorting : $nums');
}