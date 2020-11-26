import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static show(String msgStr) {
    Fluttertoast.showToast(
        msg: msgStr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xff4B4B4B),
        textColor: Colors.white,
        fontSize: 13);
  }

  static showLoad(String msgStr) {
    Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(msgStr)],
        ),
      ),
    );
  }
}
