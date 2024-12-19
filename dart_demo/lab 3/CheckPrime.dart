import 'dart:io';

void main(){

  stdout.write('Enter the value of number n = ');
  int n = int.parse(stdin.readLineSync()!);

  int count = 0;
  for(int i=2; i<n/2; i++){
    if(n%2==0){
      count ++;
      break;
    }
  }

  if(count==0){
    print('Number is Prime Number.');
  }
  else{
    print('Number is not Prime Number.');
  }
}