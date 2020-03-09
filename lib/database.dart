import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:top/model/dishes_model.dart';

abstract class BaseDB {

}

class dBase implements BaseDB {

  getDishes() async {
    QuerySnapshot snapshot = await Firestore.instance
        .collection('Dish')
        .orderBy("rating", descending: true)
        .getDocuments();

    List<Dishes> _dishList = [];

    snapshot.documents.forEach((document) {
      Dishes dishes = Dishes.fromMap(document.data);
      _dishList.add(dishes);
    });

    dishNotifier.dishList = _dishList;
  }
}