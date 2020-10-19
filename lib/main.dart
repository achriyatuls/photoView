import 'package:flutter/material.dart';
import 'view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'galery',
      theme: ThemeData(
        primarySwatch: Colors.blue[50],
      ),
      home: ViewPage(),
    );
  }
}
