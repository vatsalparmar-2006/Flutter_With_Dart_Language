import 'dart:io';

void main(){

  stdout.write('Enter the value of number n = ');
  int? n = int.parse(stdin.readLineSync()!);

  int rem, ans=0;

  while(n!=0){
    rem = (n!%10);
    ans = (ans*10) + rem;
    n = n!~/10;
  }

  print('Reverserd Number : $ans');
}