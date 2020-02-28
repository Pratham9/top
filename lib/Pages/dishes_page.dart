import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:top/Pages/dish_selected_page.dart';

class DishPage extends StatelessWidget {

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DishSelected(
              ),
            ),
          ),
          child: Container(
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
                              document
                                  ['name'],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
//                          Container(
//                            width: 140.0,
//                            child: Text(
//                              dishes[index].location,
//                              style: TextStyle(
//                                color: Colors.grey,
//                              ),
//                            ),
//                          ),
                        ],
                      ),
//                      Column(
//                        children: <Widget>[
//                          Text(
//                            '\$${dishes[index].price}',
//                            style: TextStyle(
//                              fontSize: 22.0,
//                              fontWeight: FontWeight.w600,
//                            ),
//                          ),
////                                      Text(
////                                        'plus tax',
////                                        style: TextStyle(
////                                          color: Colors.grey,
////                                        ),
////                                      ),
//                        ],
//                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.heart,
                        size: 15.0,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        '${document['rating']}',
//                        '${dishes[index].rating}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20.0,
          top: 15.0,
          bottom: 15.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
//            child: Image(
//              width: 110.0,
//              image: AssetImage(
//                dishes[index].imageUrl,
//              ),
//              fit: BoxFit.cover,
//            ),
          ),
        ),
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('dishnames').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return Column(
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
                  itemCount: snapshot.data.documents.length, //this is where we will type the desired number of item to view in a list
                  itemBuilder: (BuildContext context, index) =>
                    _buildListItem(context, snapshot.data.documents[index]),
                ),
              ),
            ],
          );
        }
      ),
    );
  }

}