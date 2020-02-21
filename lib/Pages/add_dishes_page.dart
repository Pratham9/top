import 'package:flutter/material.dart';
import 'package:top/model/dishes_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddDishesPage extends StatefulWidget {
  final Dishes dishes;

  AddDishesPage({this.dishes});
  @override
  _AddDishesPageState createState() => _AddDishesPageState();
}

class _AddDishesPageState extends State<AddDishesPage> {
  File imageFile;

  get myController => null;

  _openGallary(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make a choice!"),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("Gallary"),
                  onTap: () {
                    _openGallary(context);
                  },
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: () {
                    _openCamera(context);
                  },
                )
              ],
            )),
          );
        });
  }

  Widget decideImageView() {

    if (imageFile == null) {
    return  Image(
    image:AssetImage('assets/images/pizza.jpg'));
    } else {
    return Image.file(imageFile, width: 300, height: 200);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What did you like to today?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // decideImageView(),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child:  decideImageView(),
//                Image(
//                  image: AssetImage('assets/images/pizza.jpg'),
              //  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                    )),
                child: new Text('Upload Image',
                    style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w300)),
                onPressed: () {
                  _showChoiceDialog(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              height: 170.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Name'),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Price'),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Description'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                    )),
                child: new Text('Submit',
                    style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w300)),
                onPressed: () {
                  /*...*/
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
