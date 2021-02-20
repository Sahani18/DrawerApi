import 'package:drawer/gitUser.dart';
import 'package:drawer/you.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'gitUser.dart';
import 'contact.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("S A H A N I"),
              accountEmail: Text("sahani.subhanshu1995@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage("images/item.jpg"),
              ),
            ),
            ListTile(
              title: Text("Home"),
              trailing: Icon(Icons.home),
            ),
            ListTile(
              title: Text("Contacts"),
              trailing: Icon(Icons.assignment_ind),
              onTap: () => navi(),
            ),
            ListTile(
              title: Text("GitHub User"),
              trailing: Icon(Icons.person),
              onTap: () => gavi(),
            ),
            ListTile(
              title: Text("YouTube"),
              trailing: Icon(Icons.subscriptions),
              onTap: () => yout(),
            ),
            ListTile(
              title: Text("Cancel"),
              trailing: Icon(Icons.cancel),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 90,
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: 88,
                        backgroundColor: Colors.transparent,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(90),
                            child: _image == null
                                ? Icon(Icons.add_a_photo)
                                : Image.file(_image)),
                      ),
                      onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.orangeAccent.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    GestureDetector(
                                      child: Text('Take a Picture',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black)),
                                      onTap: getImage,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 10.0)),
                                    GestureDetector(
                                      child: Text('Pick from gallery',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black)),
                                      onTap: setImage,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              width: 450,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 80)),
                      Text(
                        'Name :  ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Xyz pqr',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 80)),
                      Text(
                        'Profile : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Flutter Developer ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 80)),
                      Text(
                        'Education :  ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'B.Tech - CSE ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 80)),
                      Text(
                        'Experience : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Fresher ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 80)),
                      Text(
                        'Contact :  ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '900000001 ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 100)),
                      Text(
                        'xyz@gmail.com ',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navi() {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Contacts()));
  }

  void gavi() {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => GitHub()));
  }

  void yout() {
    Navigator.pop(context);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Youtube()));
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
    Navigator.pop(context);
  }

  Future setImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
    Navigator.pop(context);
  }
}
