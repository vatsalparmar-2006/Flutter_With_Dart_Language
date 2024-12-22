import 'dart:io';

void main(){

  stdout.write('\nEnter the value of n = ');
  int? n = int.parse(stdin.readLineSync()!);

  List<int> numbers = [];

  for (int i = 0; i < n; i++) {
    stdout.write('Enter value for list[$i]: ');
    numbers.add(int.parse(stdin.readLineSync()!));
  }
  
  int sum = 0;
  for(int i=0; i<numbers.length; i++){
    if(numbers[i]%3==0 || numbers[i]%5==0){
      sum += numbers[i];
    }
  }
  
  print('\nSum of numbers which are divisible by 3 or 5 : $sum');
}