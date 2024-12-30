class Anonymous{

   void addition(int a, int b, Function callback){
    int c = a + b;
    callback(c);
    print('function finshied.');
  }
}
