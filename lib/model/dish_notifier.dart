import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:top/model/dishes_model.dart';

class DishNotifier with ChangeNotifier {
  List<Dbishes> _dishList = [];
  Dbishes _currentDish;

  UnmodifiableListView<Dbishes> get dishList => UnmodifiableListView(_dishList);

  Dbishes get currentFood => _currentDish;

  set dishList(List<Dbishes> dishList) {
    _dishList = dishList;
    notifyListeners();
  }

  addFood(Dbishes dish) {
    _dishList.insert(0, dish);
    notifyListeners();
  }

  deleteFood(Dbishes dish) {
    _dishList.removeWhere((_dish) => _dish.id == dish.id);
    notifyListeners();
  }
}
