import 'package:flutter/material.dart';
import 'view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'galery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ViewPage(),
    );
  }
}
