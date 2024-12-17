import 'dart:io';

void main(){

  stdout.write('\nEnter the value for starting  = ');
  int n1 = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the value for ending = ');
  int n2 = int.parse(stdin.readLineSync()!);

  List<int> primeNumbers = [];

  for(int i=n1; i<n2; i++){
     if(checkPrime(i)){
        primeNumbers.add(i);
     }
  }

  print('\nPrime numbers between $n1 and $n2 : $primeNumbers');
}

bool checkPrime(int n){
  if(n<=1){
    return false;
  }
  for(int i=2; i<=n~/2; i++){
    if(n%i == 0){
      return false;
    }
  }
  return true;
}