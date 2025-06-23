import 'package:flutter/foundation.dart';

class SliderModel extends ChangeNotifier{
  double _value=1;
  double get value => _value;

  setValue(double val){
    _value = val;
    notifyListeners();
  }
}