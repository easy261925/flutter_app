import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('FLUTTER')),
          body: HomeContent(),
        ),
        theme: ThemeData(primarySwatch: Colors.yellow));
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Flutter123A',
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 40, color: Colors.yellow),
      ),
    );
  }
}
