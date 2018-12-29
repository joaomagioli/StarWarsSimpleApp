import 'package:flutter/material.dart';
import 'package:star_wars_app/screens/movies_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MoviesList(title: 'Star Wars Movies List'),
    );
  }
}
