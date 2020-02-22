import 'package:cloud_firestore/cloud_firestore.dart';

class Dishes {
  String id;
  String imageUrl;
  String name;
  String location;
  String description;
  double price;
  double rating;
  List<Dishes> dishes;

  Dishes.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    imageUrl = data['imageUrl'];
    name = data['name'];
    location = data['location'];
    description = data['description'];
    price = data['price'];
    rating = data['rating'];
  }
}