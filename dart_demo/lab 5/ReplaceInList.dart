void main(){

  List<String> cities = ['Delhi', 'Mumbai', 'Bangalore', 'Hydrabad', 'Ahmedabad'];

  print('\nBefore Replace : $cities');

  int index = cities.indexOf('Ahmedabad');
  
  cities.removeAt(index);
  
  cities.insert(index, 'Surat');

  print('\nAfter Replace : $cities');
}