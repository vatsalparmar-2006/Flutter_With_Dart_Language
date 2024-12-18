import 'dart:io';

void main() {

  stdout.write("\nEnter first number : ");
  double num1 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter second number : ");
  double num2 = double.parse(stdin.readLineSync()!);

  stdout.write("Choose an operation (1. Addition, 2. Subtraction, 3. Multiplication, 4. Division): ");
  int choice = int.parse(stdin.readLineSync()!);

  if (choice == 1) {
    double sum = num1 + num2;
    print("\nThe result of addition is: $sum");
  }
  else if (choice == 2) {
    double sub = num1 - num2;
    print("\nThe result of subtraction is: $sub");
  }
  else if (choice == 3 || choice == 4) {
    switch (choice) {
      case 3:
        double multi = num1 * num2;
        print("\nThe result of multiplication is: $multi");
        break;
      case 4:
        if (num2 != 0) {
          double divi = num1 / num2;
          print("\nThe result of division is: $divi");
        } else {
          print("\nDivision by zero is not allowed.");
        }
        break;
      default:
        print("\nInvalid choice.");
    }
  } else {
    print("\nInvalid choice. Please select a number between 1 and 4.");
  }
}
