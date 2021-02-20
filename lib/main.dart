import'package:flutter/material.dart';
import 'draw.dart';
import 'signup.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home: DrawerApp(),
      routes: <String, WidgetBuilder> {
       "/login" :(BuildContext context)=> SignUp()
      },
    );
  }
}
