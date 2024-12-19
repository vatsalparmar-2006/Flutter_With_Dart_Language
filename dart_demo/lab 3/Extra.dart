import 'dart:io';

void main(){

  stdout.write('Enter the value of number n = ');
  double? n = double.parse(stdin.readLineSync()!);

  double rem, ans=0;

  while(n!=0){
    rem = (n!%10);
    ans = (ans*10) + rem;
    n = (n /(10.0));
  }

  print('Reverserd Number : $ans');
}