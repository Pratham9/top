import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:top/auth_services.dart';
import '../authentication.dart';
import 'dart:async';
//import 'package:provider/provider.dart';
import 'package:top/provider_widget.dart';


class UserProfilePage extends StatefulWidget {
  UserProfilePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final AuthService auth;
  final VoidCallback logoutCallback;
  final String userId;

//  final Dishes dishes;

//  UserProfilePage({this.dishes});
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  File imageFile;

  get myController => null;

 // bool get isAnonymous => null;

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
      return Image.network('http://i.imgur.com/zL4Krbz.jpg', fit: BoxFit.fill,);
    } else {
      return Image.file(imageFile, width: 300, height: 300, fit: BoxFit.fill,);
    }
  }

  Widget showSignOut(context, bool isAnonymous){
    if (isAnonymous == true) {
      return RaisedButton(
        child: Text("Sign In To Save Your Data"),
        onPressed: () {
          Navigator.of(context).pushNamed('/convertUser');
        },
      );
    } else {
      return RaisedButton(
        child: Text("Sign Out"),
        onPressed: () async {
          try {
            await Provider.of(context).auth.signOut();
          } catch (e) {
            print(e);
          }
        },
      );
    }

  }


//  signOut() async {
//    try {
//      await widget.auth.signOut();
//      widget.logoutCallback();
//    } catch (e) {
//      print(e);
//    }
//  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Hi Aras!',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 40.0, left: 40.0),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                  radius: 100,
                  child: ClipOval(
                      child: SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: decideImageView()))),
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
//                    FutureBuilder(
//                      future: Provider.of(context).auth.getCurrentUser(),
//                      builder: (context, snapshot){
//                        if (snapshot.connectionState == ConnectionState.done){
//                          return Text("done");
//                         // ${snapshot.data}
//                        }
//                        else{
//                          return CircularProgressIndicator();
//                        }
//                      },
//
//                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Username'),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Birthday'),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Email'),
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
                child: new Text('Logout',
                    style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w300)),
                onPressed: (){
                  var user;
                  showSignOut(context, user.isAnonymous);

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
