import 'dart:io';

void main(){

  stdout.write('Enter the value of n1 = ');
  int? n1 = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the value n2 = ');
  int? n2 = int.parse(stdin.readLineSync()!);

  int maxNum = findMax(n1, n2);

  print(('\nMaximum Number : $maxNum'));
}

int findMax(int n1, int n2){
  if(n1>n2){
    return n1;
  }
  return n2;
}

