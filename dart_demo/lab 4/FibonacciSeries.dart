import 'dart:io';

void main(){

  stdout.write('Enter the value of n = ');
  int? n = int.parse(stdin.readLineSync()!);

  fibonacciSeries(n);
}

void fibonacciSeries(int n){
  int firstTerm = 0, secondTerm = 1;

  stdout.write('\nFibonacci Series up to $n term : ');
  for(int i=1; i<=n; i++){
    stdout.write("$firstTerm, ");

    int nextTerm = firstTerm + secondTerm;
    firstTerm = secondTerm;
    secondTerm = nextTerm;
  }
}

