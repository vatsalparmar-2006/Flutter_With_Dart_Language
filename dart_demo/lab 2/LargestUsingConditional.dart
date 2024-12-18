import 'dart:io';

void main(){

  stdout.write("\nEnter first number : ");
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter second number : ");
  double num2 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter third number : ");
  double num3 = double.parse(stdin.readLineSync()!);

  double largest = num1 > num2 ? (num1>num3 ? num1 : num3) : (num2>num3 ? num2 : num3);
  
  print('\nLargest number is $largest');
}