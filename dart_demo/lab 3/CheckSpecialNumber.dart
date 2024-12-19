import 'dart:io';

void main(){

  stdout.write('Enter starting number n1 = ');
  int n1 = int.parse(stdin.readLineSync()!);

  stdout.write('Enter endind number n2 = ');
  int n2 = int.parse(stdin.readLineSync()!);

  stdout.write('In Range : ');
  for(int i=n1; i<=n2; i++){
    if(i%2==0 && i%3!=0){
      stdout.write("$i ");
    }
  }

}