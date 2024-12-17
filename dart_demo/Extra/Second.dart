import 'package:dart_demo/Extra/Anonymous.dart';

import 'Anonymous.dart';

void main(){

  Anonymous anonymous = Anonymous();

  anonymous.addition(10, 5, (int val){
    print(val);
  });


}