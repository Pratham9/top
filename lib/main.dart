import 'package:flutter/material.dart';
import 'authentication.dart';
import 'root_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: new RootPage(auth: new Auth()),
    );
  }
}
