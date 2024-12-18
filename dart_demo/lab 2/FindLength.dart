import 'dart:io';

void main(){
  
  stdout.write('\nEnter the string : ');
  String str = (stdin.readLineSync()!);

  int count=0, length=str.length-1;

  while(length >= 0 && str[length] != ' '){
     count++;
     length--;
  }

  print(("\nLast word's length is $count"));
}