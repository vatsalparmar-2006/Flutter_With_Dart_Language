import 'dart:io';

void main(){

  stdout.write('\nEnter the temperature in Fahrenheit : ');
  double fahrenheit = double.parse(stdin.readLineSync()!);

  double celsius = (fahrenheit - 32) * (5/9.0);

  print(('\nIn Celsius : $celsius'));
}