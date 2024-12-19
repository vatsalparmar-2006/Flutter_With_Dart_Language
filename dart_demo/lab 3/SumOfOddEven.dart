import 'dart:io';

void main(){

  bool flag = true;
  int evensum = 0;
  int oddsum = 0;

  while(flag){

    stdout.write('Enter the value of number n = ');
    int? n = int.parse(stdin.readLineSync()!);

    if(n==0){
      break;
    }
    if(n>0 && n%2==0){
      evensum += n;
    }
    if(n<0 && n%2!=0){
      oddsum += n;
    }
  }

  print('');
  print('Sum of Even Positive numbers is $evensum');
  print('Sum of Odd Negative numbers is $oddsum');
}
