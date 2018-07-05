import 'package:flutter/material.dart';
import 'package:quizo/routes.dart';

void main() => runApp(new QuizoApp());

class QuizoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Quizo App',
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo[700],
        accentColor: Colors.pinkAccent[200],
        fontFamily: 'Nunito'
      ),
      routes: routes,
    );
  }
}
