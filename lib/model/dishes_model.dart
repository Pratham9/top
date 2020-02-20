class Dishes {
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
    this.rating,
  });
}

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
    price: 19.99,
    rating: 4.7,
  ),
  Dishes(
    imageUrl: 'assets/images/burger.jpg',
    name: 'Burger',
    location: 'Montana\'s',
    description:
    'Ground beef, or minced cow meat mince or other meat used to make hamburgers. Patty, the ground meat in a circular shape to fit the burger bun.',
    price: 18.99,
    rating: 3.9,
  )
];
