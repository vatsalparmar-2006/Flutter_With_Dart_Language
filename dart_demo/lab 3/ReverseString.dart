import 'dart:ffi';
import 'dart:io';

void main(){

  stdout.write('Enter the string  : ');
  String str = (stdin.readLineSync()!);

  String nstr = "";
  String ch;

  for(int i=str.length-1; i>=0; i--){
    ch = str[i];

    nstr += ch;
  }

  print('Reversed String : $nstr');
}