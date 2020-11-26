import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child:  FlareActor(
        "assets/animations/Login.flr",
        animation: "Untitled",
        alignment: Alignment.center,
        fit: BoxFit.contain,
      )
    );
  }
}