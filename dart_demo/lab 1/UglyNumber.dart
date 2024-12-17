import 'dart:io';

void main(){

  stdout.write('Enter the number n = ');
  int n = int.parse(stdin.readLineSync()!);

  if(checkUgly(n)){
    print('\nn is Ugly Number.');
  }
  else{
    print('\nn is not Ugly Number.');
  }
}

bool checkUgly(int n){
  if(n<=0){
    return false;
  }
  while(n%2==0){
    n ~/= 2;
  }
  while(n%3==0){
    n ~/= 3;
  }
  while(n%5==0){
    n ~/= 5;
  }

  return n == 1;
}