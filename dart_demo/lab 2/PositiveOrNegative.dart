import 'dart:io';

void main(){

  stdout.write('\nEnter the first number n : ');
  int n = int.parse(stdin.readLineSync()!);

  if(n>0){
    print('\n$n is Positive Number.');
  }
  else if(n<0){
    print('\n$n is Negative Number.');
  }
  else{
    print('\n$n is Zero.');
  }
}