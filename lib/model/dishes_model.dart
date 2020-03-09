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

  Dishes({
    this.imageUrl,
    this.name,
    this.location,
    this.description,
    this.price,
    this.rating
  });

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
//
//List<Dishes> dishes = [
//  Dishes(
//    imageUrl: 'assets/images/pizza.jpg',
//    name: 'Pizza',
//    location: 'Panago Pizza',
//    description:
//    'Quality pizza delivered. Pizza, wings, salads & more. Vegan, Vegetarian and Gluten-Smart options available. Made Fresh. Gluten-Smart Options. No Artificial Colours. Vegan and Veggie Options. No Artificial Flavours. Types: Vegan, Vegetarian, Gluten-Free.',
//    price: 13.99,
//    rating: 4.5,
//  ),
//  Dishes(
//    imageUrl: 'assets/images/butterchicken.jpg',
//    name: 'Butter Chicken',
//    location: 'Mauryas Fine Indian Cuisine',
//    description:
//    'Pieces of chicken, first seared in the Tandoori oven then braised in tomato cream sauce',
//    price: 19.99,
//    rating: 4.7,
//  ),
//  Dishes(
//    imageUrl: 'assets/images/burger.jpg',
//    name: 'Burger',
//    location: 'Montana\'s',
//    description:
//    'Ground beef, or minced cow meat mince or other meat used to make hamburgers. Patty, the ground meat in a circular shape to fit the burger bun.',
//    price: 18.99,
//    rating: 3.9,
//  ),
//  Dishes(
//    imageUrl: 'assets/images/friedchicken.jpg',
//    name: 'Fried Chicken',
//    location: 'Montana\'s',
//    description:
//    'Ground beef, or minced cow meat mince or other meat used to make hamburgers. Patty, the ground meat in a circular shape to fit the burger bun.',
//    price: 24.00,
//    rating: 3.9,
//  ),
//  Dishes(
//    imageUrl: 'assets/images/pasta.jpg',
//    name: 'Pasta',
//    location: 'Montana\'s',
//    description:
//    'Ground beef, or minced cow meat mince or other meat used to make hamburgers. Patty, the ground meat in a circular shape to fit the burger bun.',
//    price: 8.99,
//    rating: 3.9,
//  ),
//  Dishes(
//    imageUrl: 'assets/images/salad.jpg',
//    name: 'Salad',
//    location: 'Montana\'s',
//    description:
//    'Ground beef, or minced cow meat mince or other meat used to make hamburgers. Patty, the ground meat in a circular shape to fit the burger bun.',
//    price: 7.99,
//    rating: 3.9,
//  ),
//  Dishes(
//    imageUrl: 'assets/images/sandwich.jpg',
//    name: 'Sandwich',
//    location: 'Montana\'s',
//    description:
//    'Ground beef, or minced cow meat mince or other meat used to make hamburgers. Patty, the ground meat in a circular shape to fit the burger bun.',
//    price: 9.99,
//    rating: 3.9,
//  )
//];