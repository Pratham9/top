import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:top/model/dishes_model.dart';

class DishNotifier with ChangeNotifier {
  List<Dishes> _dishList = [];
  Dishes _currentDish;

  UnmodifiableListView<Dishes> get dishList => UnmodifiableListView(_dishList);

  Dishes get currentFood => _currentDish;

  set dishList(List<Dishes> dishList) {
    _dishList = dishList;
    notifyListeners();
  }

  addFood(Dishes dish) {
    _dishList.insert(0, dish);
    notifyListeners();
  }

  deleteFood(Dishes dish) {
    _dishList.removeWhere((_dish) => _dish.id == dish.id);
    notifyListeners();
  }
}
