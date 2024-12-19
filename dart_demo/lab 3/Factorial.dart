import 'dart:io';

void main(){

  stdout.write('Enter the value of number n = ');
  int n = int.parse(stdin.readLineSync()!);

  int ans = 1;
  for(int i=2; i<=n; i++){
    ans = ans*i;
  }

  print('Factorial is : $ans');
}