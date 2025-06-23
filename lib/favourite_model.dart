import 'package:flutter/foundation.dart';

class FavouriteModel extends ChangeNotifier{
  List<int> _selectedIndex =[];
  List<int>  get selectedIndex => _selectedIndex;

  add(int index){
    _selectedIndex.add(index);
    notifyListeners();
  }

  removeItem(int index){
    _selectedIndex.remove(index);
    notifyListeners();
  }

}