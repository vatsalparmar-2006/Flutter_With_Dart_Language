import 'dart:io';

void main(){

  stdout.write('Enter the value of Principle p = ');
  int? p = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the value of Rate r = ');
  int? r = int.parse(stdin.readLineSync()!);

  stdout.write('Enter the value of Time period t = ');
  int? t = int.parse(stdin.readLineSync()!);

  double si = countInterest(p, r, t);

  print('\nSimple Interest : $si');
}

double countInterest(int p, int r, int t){
  double simpleInterest = (p*r*t)/100 ;

  return simpleInterest;
}