import 'package:flutter/material.dart';
import 'package:top/Pages/add_dishes_page.dart';
import 'package:top/Pages/user_profile_page.dart';

import 'Pages/dishes_page.dart';

class TabLayoutDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    //TODO: implement build
    return new MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 3,
        child: new Scaffold(
          body: TabBarView(
            children: <Widget>[
              new DishPage(),
              new AddDishesPage(),
              new UserProfilePage(),

              new TabBar(
                tabs: [
                  Tab(
                    icon: new Icon(Icons.home),
                  ),
                  Tab(
                    icon: new Icon(Icons.perm_identity),
                  ),
                  Tab(
                    icon: new Icon(Icons.settings),
                  )
                ],
                labelColor: Colors.yellow,
                unselectedLabelColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
