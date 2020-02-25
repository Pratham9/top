import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dishes {
  String imageUrl;
  String name;
  String location;
  String description;
  double price;
  double rating;
  List<Dishes> dishes;
  bool liked = false;

  Dishes({
    this.imageUrl,
    this.name,
    this.location,
    this.description,
    this.price,
    this.rating,
  });
}


class DishPage extends StatelessWidget {

  List<Dishes> dishes = [
    Dishes(
      imageUrl: 'assets/images/pizza.jpg',
      name: 'Pizza',
      location: 'Panago Pizza',
      description:
          'Quality pizza delivered. Pizza, wings, salads & more. Vegan, Vegetarian and Gluten-Smart options available. Made Fresh. Gluten-Smart Options. No Artificial Colours. Vegan and Veggie Options. No Artificial Flavours. Types: Vegan, Vegetarian, Gluten-Free.',
      price: 13.99,
      rating: 4.5,
    ),
    Dishes(
      imageUrl: 'assets/images/butterchicken.jpg',
      name: 'Butter Chicken',
      location: 'Mauryas Fine Indian Cuisine',
      description:
          'Pieces of chicken, first seared in the Tandoori oven then braised in tomato cream sauce',
      price: 9.99,
      rating: 4.7,
    ),
    Dishes(
      imageUrl: 'assets/images/burger.jpg',
      name: 'Burger',
      location: 'Montana\'s',
      description:
          'Ground beef, or minced cow meat mince or other meat used to make hamburgers. Patty, the ground meat in a circular shape to fit the burger bun.',
      price: 8.99,
      rating: 3.9,
    ),
    Dishes(
      imageUrl: 'assets/images/friedchicken.jpg',
      name: 'Fried Chicken',
      location: 'Montana\'s',
      description:
          'Ground beef, or minced cow meat mince or other meat used to make hamburgers. Patty, the ground meat in a circular shape to fit the burger bun.',
      price: 14.99,
      rating: 3.9,
    ),
    Dishes(
      imageUrl: 'assets/images/pasta.jpg',
      name: 'Pasta',
      location: 'Montana\'s',
      description:
          'Ground beef, or minced cow meat mince or other meat used to make hamburgers. Patty, the ground meat in a circular shape to fit the burger bun.',
      price: 8.99,
      rating: 3.9,
    ),
    Dishes(
      imageUrl: 'assets/images/salad.jpg',
      name: 'Salad',
      location: 'Montana\'s',
      description:
          'Ground beef, or minced cow meat mince or other meat used to make hamburgers. Patty, the ground meat in a circular shape to fit the burger bun.',
      price: 7.99,
      rating: 3.9,
    ),
    Dishes(
      imageUrl: 'assets/images/sandwich.jpg',
      name: 'Sandwich',
      location: 'Montana\'s',
      description:
          'Ground beef, or minced cow meat mince or other meat used to make hamburgers. Patty, the ground meat in a circular shape to fit the burger bun.',
      price: 4.49,
      rating: 3.9,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: dishes
                  .length, //this is where we will type the desired number of item to view in a list
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      width: 140.0,
                                      child: Text(
                                        dishes[index].name,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Container(
                                      width: 140.0,
                                      child: Text(
                                        dishes[index].location,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '\$${dishes[index].price}',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'plus tax',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Container(
                                      width: 62.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Icon(Icons.favorite, size: 30, color: post.isLiked ? Colors.red : Colors.black,),
                                          IconButton(icon: Icon(Icons.favorite), color: post.isLiked ? Colors.red : Colors.white,)
                                          IconButton(
                                            icon: Icon(Icons.favorite_border, color: Colors.black,),
                                            iconSize: 20.0,
                                            color: Colors.transparent,
                                            onPressed: (){
                                              icon: Icon(Icons.favorite, color: Colors.red,);
                                            },
                                          ),
                                          Text(
                                            '20',
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30.0),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 110.0,
                          image: AssetImage(
                            dishes[index].imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
