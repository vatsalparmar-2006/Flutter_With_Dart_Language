import 'dart:io';

void main(){

  stdout.write("\nEnter first number : ");
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter second number : ");
  double num2 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter third number : ");
  double num3 = double.parse(stdin.readLineSync()!);

  if(num1 > num2){
    if(num1 > num3){
      print('\nfirst number($num1) is largest.');
    }
    else{
      print('\nthird number($num3) is largest.');
    }
  }
  else {
    if (num2 > num3){
      print('\nSecond number($num2) is largest.');
    }
    else{
      print('\nthird number($num3) is largest.');
    }
  }
}