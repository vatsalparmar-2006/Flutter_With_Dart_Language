import 'dart:io';

void main(){
  
  stdout.write('\nEnter the first value : ');
  int n1 = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the second value : ');
  int n2 = int.parse(stdin.readLineSync()!);

  int sum = n1 + n2;

  print(('\nAddition : $sum'));
}