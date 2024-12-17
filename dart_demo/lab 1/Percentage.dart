import 'dart:io';

void main(){

  stdout.write('\nEnter the marks of first subject : ');
  int s1 = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the marks of second subject : ');
  int s2 = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the marks of third subject : ');
  int s3 = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the marks of fourth subject : ');
  int s4 = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the marks of fifth subject : ');
  int s5 = int.parse(stdin.readLineSync()!);

  double percentage = ((s1+s2+s3+s4+s5)/5.0);

  print('\nPercentage : $percentage');
}