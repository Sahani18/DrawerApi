import 'dart:ui';

import 'package:flutter/material.dart';

import 'signup.dart';

class DrawerApp extends StatefulWidget {
  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  var enter = TextEditingController();
  var play = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            // height:
            //  width:
            child: Image.asset('images/login.jpg'),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Form(
              key: _key,
              child: Card(
                color: Colors.white10,
                margin: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 30.0)),
                        Text(
                          "LOGIN USER",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.red),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30.0)),
                        ListTile(
                          leading: Text('Email         ',
                              style: TextStyle(
                                color: Colors.red,
                              )),
                          title: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: enter,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter Email ',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15.0)),
                        ListTile(
                          leading: Text('Password ',
                              style: TextStyle(
                                color: Colors.red,
                              )),
                          title: TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: true,
                            controller: play,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter Password ',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 30.0)),
                        Padding(padding: EdgeInsets.only(top: 40.0)),
                        RaisedButton(
                          onPressed: _send,
                          color: Colors.teal,
                          child: Text(
                            'Enter',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  _send() {
    if (_key.currentState.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignUp()));
      //  }
    }
  }
}