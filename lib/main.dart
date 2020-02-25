import 'package:flutter/material.dart';
import 'authentication.dart';
import 'Pages/root_page.dart';
import 'package:top/model/dish_notifier.dart';
import 'package:provider/provider.dart';



void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      builder: (context) => DishNotifier(),
    ),
  ],
  child: MyApp(),
));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7), /////////////////////
      ),
      home: new RootPage(auth: new Auth()),
    );
  }
}
