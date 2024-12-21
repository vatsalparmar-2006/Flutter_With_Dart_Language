import 'dart:io';

void main(){

  stdout.write('\nEnter the value of n = ');
  int? n = int.parse(stdin.readLineSync()!);

  int confirmPrime = checkPrime(n);

  if(confirmPrime==1){
    print('\nNumber is Prime.');
  }
  else{
    print('\nNumber is not Prime.');
  }
}

int checkPrime(int n){
  int count = 0;
  for(int i=2; i<n/2; i++){//
    if(n%i==0){
      count ++;
    }
  }
  return count==0 ? 1: 0;
}