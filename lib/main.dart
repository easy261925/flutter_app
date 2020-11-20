import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 780,
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.red, width: 3),
          // ),
          child: FlareActor(
            "assets/animations/Login.flr",
            animation: "Untitled",
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
