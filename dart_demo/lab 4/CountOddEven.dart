import 'dart:io';

void main() {
  stdout.write('Enter the value of n = ');
  int? n = int.parse(stdin.readLineSync()!);

  List<int> numbers = [];

  for (int i = 0; i < n; i++) {
    stdout.write('Enter value for list[$i]: ');
    numbers.add(int.parse(stdin.readLineSync()!));
  }

  Map<int, int> counts = countOddEven(numbers);
  print('Even count: ${counts[0]}');
  print('Odd count: ${counts[1]}');
}

Map<int, int> countOddEven(List<int> numbers) {
  int oddCount = 0, evenCount = 0;

  for (int number in numbers) {
    if (number % 2 == 0) {
      evenCount++;
    } else {
      oddCount++;
    }
  }

  return {
    0: evenCount, // Key 0 for even count
    1: oddCount   // Key 1 for odd count
  };
}