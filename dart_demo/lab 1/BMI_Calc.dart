import 'dart:io';

void main(){

  stdout.write('\nEnter the weight in pounds : ');
  double w1 = double.parse(stdin.readLineSync()!);

  stdout.write('Enter the height in inches : ');
  double h1 = double.parse(stdin.readLineSync()!);

  double w2 = w1*(.45359237);
  double h2 = h1*(.0254);

  double BMI = w2/(h2*h2);

  print('\nBMI is $BMI');
}